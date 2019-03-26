library(dexterMST)


### Name: create_mst_test
### Title: Define a new multi stage test
### Aliases: create_mst_test

### ** Examples

# extended example
# we: 
# 1) simulate complete data
# 2) cut it up according to an MST design
# 3) create a project, enter scoring rules and define the MST test
# 4) do an analysis

library(dplyr)
sim_RM = function(theta,delta)
{ 
  nP=length(theta)
  dat=matrix(0,nP,length(delta))
  for (i in 1:length(delta)) dat[,i]=1*(rlogis(nP,0,1)<=(theta-delta[i]))
  return(dat)
}

## Simulate data set with all routing
scoring_rules = data.frame(item_id=rep(sprintf("item%02.0f",1:70), each=2),
                           response=rep(0:1,times=70),
                           item_score=rep(0:1,times=70))


design = data.frame(item_id=sprintf("item%02.0f",1:70),
                    module_id=rep(c('M4','M2','M5','M1','M6','M3', 'M7'),times=rep(10,7)),
                    item_position=rep(1:10,7))

delta = sort(runif(70,-1,1))
theta = rnorm(2000,0,1)

data = data.frame(sim_RM(theta,delta))
colnames(data) = sprintf("item%02.0f",1:70)
data$person_id = 1:nrow(data)

scoring_rules = data.frame(item_id=rep(sprintf("item%02.0f",1:70), each=2),
                           response=rep(0:1,times=70),
                           item_score=rep(0:1,times=70))

design = data.frame(item_id=sprintf("item%02.0f",1:70),
                    module_id=rep(c('M4','M2','M5','M1','M6','M3', 'M7'),times=rep(10,7)),
                    item_position=rep(1:10,7))

db = create_mst_project(":memory:")
add_scoring_rules_mst(db, scoring_rules)


routing_rules = mst_rules(
  `124` = M1[0:5] --+ M2[0:10] --+ M4, 
  `125` = M1[0:5] --+ M2[11:15] --+ M5,
  `136` = M1[6:10] --+ M3[6:15] --+ M6,
  `137` = M1[6:10] --+ M3[16:20] --+ M7)

create_mst_test(db,
                test_design = design,
                routing_rules = routing_rules,
                test_id = 'RU',
                routing = "all")

subset(data,(rowSums(data[,31:40])<=5)&(rowSums(data[,c(31:40,11:20)])<=10),
       select=c(item31:item40, item11:item20, item01:item10, person_id)) %>%
  add_booklet_mst(db,.,booklet_id='124',test_id='RU')

subset(data,(rowSums(data[,31:40])<=5)&(rowSums(data[,c(31:40,11:20)])>10),
       select=c(item31:item40, item11:item20, item21:item30,person_id)) %>%
  add_booklet_mst(db,.,booklet_id='125',test_id='RU')

subset(data,(rowSums(data[,31:40])>5)&(rowSums(data[,c(31:40,51:60)])<=15),
       select=c(item31:item40,item51:item60, item41:item50, person_id)) %>%
  add_booklet_mst(db,.,booklet_id='136',test_id='RU')

subset(data,(rowSums(data[,31:40])>5)&(rowSums(data[,c(31:40,51:60)])>15),
       select=c(item31:item40, item51:item60, item61:item70, person_id)) %>%
  add_booklet_mst(db,.,booklet_id='137',test_id='RU')

design_plot(db)

f = fit_enorm_mst(db)

head(coef(f))

abl = ability(get_responses_mst(db), f) %>%
   inner_join(tibble(person_id=as.character(1:2000), theta.sim=theta), by='person_id')

plot(abl$theta, abl$theta.sim)   

abl = filter(abl, is.finite(theta))

cor(abl$theta, abl$theta.sim)




