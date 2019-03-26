## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align='center',fig.width=5,fig.height=5, dev='CairoPNG') 

par_hook = function(before, options, envir)
{
  if(before)
  {
    do.call(par, options$par)
  }
}
knit_hooks$set(par = par_hook)

options(digits=3, knitr.kable.NA='')

library(dexter)
library(igraph)
library(dexterMST)
library(tidyr)
library(dplyr)
library(mirt)
library(RSQLite)
library(ggplot2)

## ----zwitsermaris, include=FALSE-----------------------------------------
sim_RM = function(theta,delta)
{
  nP=length(theta)
  dat=matrix(0,nP,length(delta))
  for (i in 1:length(delta)) dat[,i]=1*(rlogis(nP,0,1)<=(theta-delta[i]))
  return(dat)
}
a = rep(1,50)
delta = c(runif(20,-2.3,0),runif(10,-0.6,2),runif(20,1.2,2.4)) # M2, M1, M3
b=exp(-delta)
c = rep(0,50)
nP = 10000
# simulate theta from a mixture of two normals
grp = sample(2, nP, replace = TRUE, prob = c(.6,.4))
theta = rnorm(nP, mean = c(0,1)[grp], sd = c(1.5,0.5)[grp])

data = data.frame(sim_RM(theta, delta))
colnames(data) = sprintf("item%02.0f",1:50)

# create an mst project
db = create_mst_project(":memory:")

# define dummy item scoring rules (i.e. response==score)
scoring_rules = data.frame(item_id = rep(colnames(data), each=2),
                            response = rep(0:1,times=50),
                            item_score = rep(0:1,times=50))

add_scoring_rules_mst(db, scoring_rules)


# define routing rules
routing_rules = mst_rules(
  easy = Mod_1[0:5] --+ Mod_2, 
  hard = Mod_1[6:10] --+ Mod_3)

# define a module design (i.e.e which items belong in which modules)
design = data.frame(module_id = rep(c('Mod_2','Mod_1','Mod_3'), times=c(20,10,20)),
                   item_id = paste0("item",sprintf("%02.0f",1:50)),
                   item_position = c(1:20,1:10,1:20))

# create/define an mst test
create_mst_test(db,
                test_design = design,
                routing_rules = routing_rules,
                test_id = 'ZwitserMaris')



# add person id to the data
data$person_id = 1:nrow(data)

# extract two booklets from the complete data, based on the sum score on the first module
bk1 = data[rowSums(data[,21:30])<=5,] %>% select(person_id, item01:item30)
bk2 = data[rowSums(data[,21:30])>5,] %>% select(person_id, item21:item30, item31:item50)

# add response data to the project

add_booklet_mst(db, bk1, test_id = 'ZwitserMaris', booklet_id = 'easy')
add_booklet_mst(db, bk2, test_id = 'ZwitserMaris', booklet_id = 'hard')


## ---- echo=FALSE, out.width=300,out.height=300, fig.width=5,fig.height=5----
design_plot(db,vertex.size=70,vertex.size2=30, vertex.label.cex=1.5, edge.label.cex=1.5)

## ---- eval=FALSE---------------------------------------------------------
#  db = create_mst_project(":memory:")

## ---- echo=FALSE---------------------------------------------------------
scoring_rules %>% slice(1:8) %>% kable(caption='data.frame scoring_rules', row.names=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  add_scoring_rules_mst(db, scoring_rules)

## ---- echo=FALSE---------------------------------------------------------
design %>% slice(1:8) %>% kable(caption='data.frame design')

## ------------------------------------------------------------------------
routing_rules = mst_rules(
  easy = Mod_1[0:5] --+ Mod_2, 
  hard = Mod_1[6:10] --+ Mod_3)

## ---- eval=FALSE---------------------------------------------------------
#  create_mst_test(db,
#                  test_design = design,
#                  routing_rules = routing_rules,
#                  test_id = 'ZwitserMaris')

## ---- echo=FALSE---------------------------------------------------------
bk1[1:4,1:6] %>% mutate(item06='...') %>% kable(caption='example data in wide format (`bk1` below)', row.names=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  add_booklet_mst(db, bk1, test_id = 'ZwitserMaris', booklet_id = 'easy')
#  add_booklet_mst(db, bk2, test_id = 'ZwitserMaris', booklet_id = 'hard')

## ----fig.width=8,fig.height=4,out.width='100%',par=list(mfrow=c(1,2))----
fi = fit_inter_mst(db, test_id = 'ZwitserMaris', booklet_id = 'hard')

plot(fi, item_id='item21')
plot(fi, item_id='item45')

## ---- results='hide'-----------------------------------------------------
f = fit_enorm_mst(db)

coef(f)

## ---- echo=FALSE---------------------------------------------------------
coef(f) %>% slice(1:8) %>% kable(caption='some item parameters fit on multi stage data')


## ---- echo=FALSE, message=FALSE, warning=FALSE,results='hide'------------
## add an arbitrary item property
item_domain=c(sample(c("A", "B", "C"), 20, replace = T), rep("B", 10), sample(c("A", "B", "C"), 20, replace = T))
item_type = data.frame(item_id = get_items_mst(db), item_domain=item_domain)
add_item_properties_mst(db, item_type)

prof = profile_tables_mst(f, dbReadTable(db, 'items'), 'item_domain')

## ---- echo=FALSE, fig.align="center", fig.height=3, fig.width=6, results='hide', message=FALSE, warning=FALSE----
observed = dbGetQuery(db,
                      "SELECT booklet_id, 
                      person_id, item_domain, item_score 
                      FROM Responses 
                      INNER JOIN Items USING(item_id) 
                      INNER JOIN Scoring_rules 
                      USING(item_id,response);") %>%
  group_by(booklet_id, person_id, item_domain) %>% 
  summarise(observed_score = sum(item_score)) %>% 
  group_by(booklet_id, person_id) %>% 
  mutate(sumScore = sum(observed_score))
## average
observed_smooth = observed %>%
  group_by(booklet_id, sumScore, item_domain) %>%
  summarise(observed_score = mean(observed_score)) %>%
  ungroup()
## Ignore the MST design and use dexter
prof_naive = dexter::profile_tables(f, dbReadTable(db, 'items'), 'item_domain') %>%
  mutate(booklet_id=gsub('^\\w+\\.','',booklet_id))
## plot the results
ggplot(full_join(prof, prof_naive, 
                 by=c('sumScore','booklet_id','item_domain')) %>%
         full_join(observed_smooth, by=c('sumScore','booklet_id','item_domain')),
       aes(x = sumScore, y = expected_domain_score.x, colour = item_domain)) +
  geom_line(size=0.3) + 
  geom_point(aes(y=observed_score), size = 0.1) +
  facet_grid(booklet_id~.,scale='free_y') + 
  geom_line(aes(y=expected_domain_score.y), linetype = 'dotted',size=0.4) +
  theme(panel.background = element_blank()) +
  labs(y='domain score', x ='test score')


## ---- results='hide'-----------------------------------------------------
abl = ability_tables(f, method='MLE')
abl

## ---- echo=FALSE---------------------------------------------------------
abl %>% slice(1:10) %>% kable(caption='score transformation table (abl)')


## ----eval=FALSE----------------------------------------------------------
#  f2 = fit_enorm_mst(db, item_id != 'item21')

## ----echo=FALSE----------------------------------------------------------
plot(density(theta),bty='n',main='true distribution of ability',xlab=expression(theta))


## ---- echo = FALSE,fig.height=3, fig.width=7, results='hide'-------------

# Correct cml with dexterMST
delta.cml.mst = coef(f)$beta

# ordinary cml with dexter
long.data = gather(bk1, key='item_id', value='item_score', -.data$person_id) %>%
  bind_rows(gather(bk2, key='item_id', value='item_score', -.data$person_id))

par.cml.lin = fit_enorm(long.data)
delta.cml.lin = coef(par.cml.lin)$beta 

# mml with mirt
data4mml = select(data, -person_id)
data4mml[rowSums(data[,1:10]) <= 5,31:50] <- NA
data4mml[rowSums(data[,1:10]) > 5,11:30] <- NA

par.mml = mirt(data4mml, 1, 'Rasch', SE=TRUE, verbose=FALSE)
delta.mml = -extract.mirt(par.mml,"parvec")[1:50]


par(mfrow=c(1,3), bty='l')
lim = c(floor(min(delta))-.5, ceiling(max(delta))+.5)
plot(delta, delta.cml.mst +mean(delta) - mean(delta.cml.mst),
     col=rep(1:3,times=c(20,10,20)),
     main="MST CML", ylab = "estimate",xlim=lim,ylim=lim)
abline(0,1,lty=3)

plot(delta, delta.cml.lin +mean(delta) - mean(delta.cml.lin),
     col=rep(1:3,times=c(20,10,20)),
     main="Linear CML", ylab = "estimate",xlim=lim,ylim=lim)
abline(0,1,lty=3)

plot(delta, delta.mml+mean(delta) - mean(delta.mml),
     col=rep(1:3,times=c(20,10,20)),
     main="MML", ylab = "estimate",xlim=lim,ylim=lim)
abline(0,1,lty=3)

## ---- eval=FALSE---------------------------------------------------------
#  tia_tables(get_responses_mst(db))$testStats %>%
#    select(booklet_id, meanP)

## ---- echo=TRUE----------------------------------------------------------
tia_tables(get_responses_mst(db))$testStats %>%
  select(booklet_id, meanP) %>%
  kable(caption='mean item correct')


## ---- par=list(bty='l')--------------------------------------------------
rsp_data = get_responses_mst(db)
pv = plausible_values(rsp_data, parms = f)

plot(density(pv$PV1), main='plausible value distribution', xlab='pv')

## ---- out.width=300,out.height=300, fig.width=5,fig.height=5-------------
design_plot(db, item_id!="item21")

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  db = open_mst_project("/home/timo/Documents/statlib/bitbucket/acet_mst_2018_8001.db")
#  dbExecute(db, "alter table tests add column routing text not null default 'all'")
#  f = fit_enorm_mst(db, test_id=="RRA1")
#  design_plot(db,test_id=="RRA1")

## ---- eval=FALSE---------------------------------------------------------
#  lin.test_design = data.frame(module_id='mod1', item_id=paste('item',1:30), item_positon = 1:30)
#  lin.rules = mst_rules(lin.booklet = mod1)
#  create_mst_test(db, lin.test_design, lin.rules, test_id = 'linear test')
#  

## ---- echo=FALSE---------------------------------------------------------
close_mst_project(db)

