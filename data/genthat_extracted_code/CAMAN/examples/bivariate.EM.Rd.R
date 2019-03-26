library(CAMAN)


### Name: bivariate.EM
### Title: EM-algorithm for bivariate normally distributed data
### Aliases: bivariate.EM
### Keywords: datasets

### ** Examples

## Not run: 
##D # 1.EM and classification for bivariate data with starting values
##D data(rs12363681)
##D lambda1<-c(1540.97, 837.12, 945.40, 1053.69)
##D lambda2<-c(906.66, 1371.81 ,1106.01,973.11)
##D p<-c(0.05,0.15,0.6,0.2)
##D test<-bivariate.EM(obs1=x, obs2=y, type="bi", lambda1=lambda1,lambda2=lambda2,
##D                    p=p,data=rs12363681,class="TRUE")
##D # scatter plot with ellipse
##D plot(test, ellipse=TRUE)
##D # scatter plot without ellipse
##D plot(test, ellipse=FALSE)
## End(Not run)
# 2. EM-algorithm for a diagnostic meta-analysis with bivariate 
#    normally distributed data and study specific fixed variances
data(CT)
p2<-c(0.4,0.6)
lamlog12<-c(2.93,3.22)
lamlog22<-c(2.5,1.5)
ct.m1 <- bivariate.EM(obs1=logitTPR, obs2=logitTNR, 
                      var1=varlogitTPR, var2=varlogitTNR,
                      type="meta", lambda1=lamlog12, lambda2=lamlog22,
                      p=p2,data=CT,class="TRUE")



