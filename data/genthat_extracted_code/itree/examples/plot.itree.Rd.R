library(itree)


### Name: plot.itree
### Title: Plot an itree Object
### Aliases: plot.itree
### Keywords: tree

### ** Examples

#the rpart example:
fit <- itree(Price ~ Mileage + Type + Country, cu.summary)
plot(fit, compress=TRUE)
text(fit, use.n=TRUE)

### new to itree, plotting node risk:
require(mlbench); data(BostonHousing)
#fit a tree:
cart <- itree(medv~.,BostonHousing,minsplit=25,minbucket=25,cp=0)

#generate theta-hat values by computing average out-of-bag loss:
## Not run: 
##D theta_hats <- getOOBLoss(model_tree.obj=cart.bh,data=bh,nboot=100)
##D 
##D # Then for each leaf we estimate local risk by the mean in-node theta-hat.
##D lre <- estNodeRisk(tree.obj=cart.bh,est_observation_loss=theta_hats$avgOOBloss)
##D 
##D # to add the lre to the plot:
##D plot(cart.bh, do_node_re= TRUE, uniform=TRUE)
##D text(cart.bh, est_node_risk = lre)
## End(Not run)

#plot using highlighting for one-sided methods:
purity.tree <- itree(medv~.,BostonHousing,minsplit=25,minbucket=25,cp=0,method="purity")
plot(purity.tree,highlight.color="blue")
text(purity.tree)




