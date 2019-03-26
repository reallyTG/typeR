library(xxIRT)


### Name: mst_sim
### Title: Simulation of Multistage Testing
### Aliases: mst_sim mst_sim print.mst_sim plot.mst_sim

### ** Examples

## Not run: 
##D ## assemble a MST
##D nitems <- 200
##D pool <- with(model_3pl_gendata(1, nitems), data.frame(a=a, b=b, c=c))
##D pool$content <- sample(1:3, nrow(pool), replace=TRUE)
##D x <- mst(pool, "1-2-2", 2, 'topdown', len=20, max_use=1)
##D x <- mst_obj(x, theta=-1, indices=1)
##D x <- mst_obj(x, theta=0, indices=2:3)
##D x <- mst_obj(x, theta=1, indices=4)
##D x <- mst_constraint(x, "content", 6, 6, level=1)
##D x <- mst_constraint(x, "content", 6, 6, level=2)
##D x <- mst_constraint(x, "content", 8, 8, level=3)
##D x <- mst_stage_length(x, 1:2, min=5)
##D x <- mst_assemble(x)
##D 
##D ## ex. 1: administer the MST using fixed RDP for routing
##D x_sim <- mst_sim(x, .5, list(stage1=0, stage2=0))
##D plot(x_sim)
##D 
##D ## ex. 2: administer the MST using the max. info. for routing
##D x_sim <- mst_sim(x, .5)
##D plot(x_sim, ylim=c(-5, 5))
## End(Not run)



