library(BACCT)


### Name: heatmap_decision
### Title: Heatmap for Decision Rules
### Aliases: heatmap_decision

### ** Examples

## Not run: 
##D #borrow from 3 historical trials#
##D yh = c(11,300,52);nh = c(45,877,128)
##D #specify current trial sample sizes#
##D n1 = 20;n2 = 30
##D obj = BAC_binom(yh=yh,nh=nh,n1=n1,n2=n2,n.chain=5,
##D criterion.type="prob",prob.threshold=0.1,sim.mode="express")
##D 
##D #generate full heatmap
##D heatmap_decision(obj,decision.rule=c(0.05,0.15))
##D #generate partial heatmap
##D heatmap_decision(obj,decision.rule=c(0.05,0.15),y1.display=5:15,y2.display=10:25)
##D 
## End(Not run)



