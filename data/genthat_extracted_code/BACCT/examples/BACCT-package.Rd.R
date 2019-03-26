library(BACCT)


### Name: BACCT-package
### Title: Bayesian Augmented Control for Clinical Trials
### Aliases: BACCT BACCT-package

### ** Examples

## Not run: 
##D library(BACCT)
##D 
##D #############################
##D #Example for binary response#
##D #############################
##D 
##D #specify historical data
##D yh = c(11,305,52);nh = c(45,874,120)
##D #specify subjects
##D n1 = 20;n2 = 30
##D #implement BAC and wait patiently
##D post = BAC_binom(yh=yh,nh=nh,n1=n1,n2=n2,n.chain=5,
##D        criterion.type="diff",sim.mode="express")
##D #evaluate the decision
##D rule1 = decision_eval(object=post,decision.rule=c(0.05,0.05),
##D         control.range=seq(0.3,0.5,0.01),es=c(0,0.1,0.15),csv.name="rule1.csv")
##D #plot the decision evaluation
##D (fig1 = plot(rule1))
##D #continue polishing the figure
##D #add data points
##D fig1 + geom_point(size=4)
##D #replace the title
##D fig1 + ggtitle("replace title")
##D #add reference lines
##D fig1 + geom_hline(aes(yintercept=0.05)) +
##D        geom_vline(aes(xintercept=0.42),color="black",type="dashed")
## End(Not run)




