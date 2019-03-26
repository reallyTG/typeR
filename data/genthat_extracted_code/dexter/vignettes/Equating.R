## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, dev='CairoPNG') #
library(dexter)
library(calibrate)
library(dplyr)
library(ggplot2)

## ---- echo=FALSE---------------------------------------------------------
CurlyBraces <- function(x, y, range, pos = 1, direction = 1 ) {

    a=c(1,2,3,48,50)    # set flexion point for spline
    b=c(0,.2,.28,.7,.8) # set depth for spline flexion point

    curve = spline(a, b, n = 50, method = "natural")$y / 2 

    curve = c(curve,rev(curve))

    a_sequence = rep(x,100)
    b_sequence = seq(y-range/2,y+range/2,length=100)  

    # direction
    if(direction==1)
    a_sequence = a_sequence+curve
    if(direction==2)
    a_sequence = a_sequence-curve

    # pos
    if(pos==1)
    lines(a_sequence,b_sequence) # vertical
    if(pos==2)
    lines(b_sequence,a_sequence) # horizontal

    }

x = seq (-4,4,len=101)
plot (c(1,1-plogis(x,-.5, .5),0), c(1,1-plogis(x,.7,.5),0), type="l", xlim=c(0,1), ylim=c(0,1), xlab='FPR', ylab='TPR',bty='l')
points(1-plogis(0,-.5, .5), 1-plogis(0,.7,.5), pch=19)
points(1-plogis(-1.5,-.5, .5), 1-plogis(-1.5,.7,.5), pch=19, col='gray')

curve(plogis(x,-.5,.5), -4, 4, col=2, xlab='x', ylab='Probability',bty='l')
curve(plogis(x,.7,.5), -4, 4, add=TRUE, col=4)
abline(v=0)
abline(v=-1.5, col='gray')
rg=1-plogis(0,-.5,.5)
text(-1,1-rg/2,'FPR',cex=.6)
CurlyBraces(x=0, y=1-rg/2, range=rg, dir=2)
rg=1-plogis(0,.7,.5)
CurlyBraces(x=0, y=1-rg/2, range=rg, dir=1)
text(1,1-rg/2,'TPR',cex=.6)


## ----echo=FALSE, message=FALSE, results='hide', fig.align='center', fig.height=4, fig.width=4----
library(dexter)
db = start_new_project(verbAggrRules, "verbAggression.db")
add_booklet(db, verbAggrData, "data")
ts = get_testscores(db, item_position<15) %>%
  inner_join(get_testscores(db, item_position>=15), by='person_id') %>%
  rename(ref_test= 'test_score.y', new_test = 'test_score.x')
#plot(ts$new_test, ts$ref_test, ylab="ref. test score", xlab="new test score", cex=0.8, pch=16)
#abline(h=10, lty=2, col="green")
ggplot(ts, aes(x = new_test, y = ref_test)) +
  geom_count(show.legend = F) +
  geom_hline(yintercept = 10, colour = 'green') +
  labs(y = 'ref. test score', x = 'target test score') +
  theme(panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

## ---- fig.align='center', fig.height=5, fig.width=5----------------------
prob_pass = tp = rep(0,29)
for (i in seq_along(0:28)){
  prob_pass[i] = sum(ts$ref_test[ts$new_test==i]>=10) / sum(ts$new_test==i)
  tp[i] = sum(ts$ref_test[ts$new_test>=i]>=10) / sum(ts$new_test>=i)
}
plot(0:28, prob_pass, ylab="Proportion passing the reference test", xlab="New test score", ylim=c(0,1), type = "o", col="red",bty='l')
lines(0:28, tp, type="o", lty=2, col="blue")

## ---- fig.align='center', fig.height=5, fig.width=5----------------------
specificity = sensitivity = rep(0, 29)
for (i in seq_along(0:28)){
  sensitivity[i] = sum(ts$ref_test[ts$new_test>=i]>=10)/sum(ts$ref_test>=10)
  specificity[i] = sum(ts$ref_test[ts$new_test<i]<10)/(sum(ts$ref_test[ts$new_test<i]<10)+sum(ts$ref_test[ts$new_test>=i]<10)) 
}
plot(0:28, sensitivity, ylab="sensitivity/specificity", xlab="new test score", ylim=c(0,1), type = "o", col="red",bty='l')
lines(0:28, specificity, col="green", type="o")

## ---- fig.align='center', fig.height=5, fig.width=5----------------------
plot(1-specificity, sensitivity, col="green", xlim=c(0,1), ylim=c(0,1), type="l",bty='l')
textxy(1-specificity, sensitivity, as.character(0:28), cex=0.7, offset = 0)
abline(0,1,lty=2, col="grey")

## ---- echo=FALSE---------------------------------------------------------
dbDisconnect(db)
unlink("verbAggression.db")

## ---- echo=FALSE, message=FALSE, results='hide'--------------------------
nP = 700
nI = 60
theta = c(rnorm(500, 0,2), rnorm(nP-500, 0.5,2))
delta = runif(nI,-1,1)
x = 0 + matrix(rlogis(nP*nI, outer(theta, delta, "-")) > 0, nP, nI)
x1 = as.data.frame(x[1:500, 1:40])
names(x1) = paste0('i', 1:40)
x2 = as.data.frame(x[501:nP, 21:60])
names(x2) = paste0('i', 21:60)

## ---- echo=FALSE, message=FALSE, results='hide'--------------------------
rules = data.frame(item_id=rep(paste0('i',1:60), each=2), response=rep(c(0,1),60), item_score=rep(c(0,1),60))
db_sm = start_new_project(rules, db="sim_inc")
add_booklet(db_sm, x=x1, "bk1")
add_booklet(db_sm, x=x2, "bk2")
ref_items = paste0("i",1:40)
new_booklet = "bk2"
pass_fail = 23
target_items = colnames(x2)

## ---- message=FALSE, fig.align='center', results='hide',fig.height=4,fig.width=4----
ou_e = probability_to_pass(db_sm, ref_items = ref_items, 
                                  design = tibble(booklet_id="bk2", item_id=target_items), 
                                  pass_fail = pass_fail)
plot(ou_e, what="equating")

## ---- echo=TRUE, fig.align='center', results='hide', fig.height=4, fig.width=4----
plot(ou_e, what='sens/spec')

## ---- echo=FALSE, message=FALSE------------------------------------------
dbDisconnect(db_sm)
unlink("sim_inc")

## ---- eval = FALSE-------------------------------------------------------
#    p_pass_given_s = out$probability_to_pass
#    ps = ou_e$pnew
#    tp = rev(cumsum(rev(p_pass_given_s*ps))) / rev(cumsum(rev(ps)))
#    sensitivity = rev(cumsum(rev(p_pass_given_s*ps))) / tp[1]
#  
#    tn = rev(cumsum(rev((1-p_pass_given_s)*ps))) / rev(cumsum(rev(ps)))
#    specificity =  1 - rev(cumsum(rev((1-p_pass_given_s)*ps))) / tn[1]

