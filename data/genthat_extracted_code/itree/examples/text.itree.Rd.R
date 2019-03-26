library(itree)


### Name: text.itree
### Title: Place Text on a Dendrogram
### Aliases: text.itree
### Keywords: tree

### ** Examples

# from rpart:
freen.tr <- itree(y ~ ., freeny)
plot(freen.tr)
text(freen.tr, use.n=TRUE, all=TRUE)

###unique to itree, plotting node risk:
require(mlbench); data(BostonHousing)
#fit a tree:
cart <- itree(medv~.,BostonHousing,minsplit=25,minbucket=25,cp=0)

#generate theta-hat values by computing average out-of-bag loss:
## Not run: 
##D #don't run it because of time to do the bootstrap...
##D theta_hats <- getOOBLoss(model_tree.obj=cart.bh,data=bh,nboot=100)
##D 
##D # Then for each leaf we estimate local risk by the mean in-node theta-hat.
##D lre <- estNodeRisk(tree.obj=cart.bh,est_observation_loss=theta_hats$avgOOBloss)
##D 
##D # to add the lre to the plot:
##D plot(cart.bh, do_node_re= TRUE, uniform=TRUE)
##D text(cart.bh, est_node_risk = lre)
## End(Not run)



