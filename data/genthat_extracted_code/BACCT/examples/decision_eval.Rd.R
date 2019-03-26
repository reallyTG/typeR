library(BACCT)


### Name: decision_eval
### Title: Evaluating a Decision Rule
### Aliases: decision_eval

### ** Examples

## Not run: 
##D #borrow from 3 historical trials#
##D yh = c(11,300,52);nh = c(45,877,128)
##D #specify current trial sample sizes#
##D n1 = 20;n2 = 30
##D obj = BAC_binom(yh=yh,nh=nh,n1=n1,n2=n2,n.chain=5,
##D criterion.type="prob",prob.threshold=0.1,sim.mode="express")
##D 
##D rule = decision_eval(obj,decision.rule=c(0.05,0.15),
##D control.range=seq(0.3,0.5,0.01),es=c(0,0.1,0.2),csv.name="result.csv")
##D 
##D #S3 method for class "BACdecision"
##D plot(rule,interim=T)
## End(Not run)



