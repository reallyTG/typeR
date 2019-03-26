library(ggallin)


### Name: geom_cloud
### Title: geom_cloud
### Aliases: geom_cloud GeomCloud
### Keywords: internal plotting

### ** Examples

set.seed(2134)
nobs <- 200
mydat <- data.frame(grp=sample(c(0,1),nobs,replace=TRUE),
  colfac=sample(letters[1:2],nobs,replace=TRUE),
  rowfac=sample(letters[10 + (1:3)],nobs,replace=TRUE)) 
mydat$x <- seq(0,1,length.out=nobs) + 0.33 * mydat$grp
mydat$y <- 0.25 * rnorm(nobs) + 2 * mydat$grp
mydat$grp <- factor(mydat$grp)
mydat$se  <- sqrt(mydat$x)

ggplot(mydat,aes(x=x,y=y,ymin=y-se,ymax=y+se,color=grp)) +
facet_grid(rowfac ~ colfac) + 
geom_line() + 
geom_errorbar() + 
labs(title='uncertainty by errorbar')

ggplot(mydat,aes(x=x,y=y,ymin=y-se,ymax=y+se,fill=grp)) +
facet_grid(rowfac ~ colfac) + 
geom_line() + 
geom_cloud(steps=15,max_alpha=0.85) +
labs(title='uncertainty by cloudr')



