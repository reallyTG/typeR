library(survey)


### Name: svrepdesign
### Title: Specify survey design with replicate weights
### Aliases: svrepdesign svrepdesign.default svrepdesign.imputationList
###   svrepdesign.character [.svyrep.design image.svyrep.design
###   print.svyrep.design model.frame.svyrep.design summary.svyrep.design
###   print.summary.svyrep.design
### Keywords: survey

### ** Examples

data(scd)
# use BRR replicate weights from Levy and Lemeshow
repweights<-2*cbind(c(1,0,1,0,1,0), c(1,0,0,1,0,1), c(0,1,1,0,0,1),
c(0,1,0,1,1,0))
scdrep<-svrepdesign(data=scd, type="BRR", repweights=repweights, combined.weights=FALSE)
svyratio(~alive, ~arrests, scdrep)

## Not run: 
##D ## Needs RSQLite
##D library(RSQLite)
##D db_rclus1<-svrepdesign(weights=~pw, repweights="wt[1-9]+", type="JK1", scale=(1-15/757)*14/15,
##D data="apiclus1rep",dbtype="SQLite", dbname=system.file("api.db",package="survey"), combined=FALSE)
##D svymean(~api00+api99,db_rclus1)
##D 
##D summary(db_rclus1)
##D 
##D ## closing and re-opening a connection
##D close(db_rclus1)
##D db_rclus1
##D try(svymean(~api00+api99,db_rclus1))
##D db_rclus1<-open(db_rclus1)
##D svymean(~api00+api99,db_rclus1)
##D 
##D 
##D 
## End(Not run)




