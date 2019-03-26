library(sirt)


### Name: R2conquest
### Title: Running ConQuest From Within R
### Aliases: R2conquest summary.R2conquest read.show read.show.term
###   read.show.regression read.pv read.multidimpv read.pimap
### Keywords: ConQuest summary

### ** Examples

## Not run: 
##D # define ConQuest path
##D path.conquest <- "C:/Conquest/"
##D 
##D #############################################################################
##D # EXAMPLE 1: Dichotomous data (data.pisaMath)
##D #############################################################################
##D library(sirt)
##D data(data.pisaMath)
##D dat <- data.pisaMath$data
##D 
##D # select items
##D items <- colnames(dat)[ which( substring( colnames(dat), 1, 1)=="M" ) ]
##D 
##D #***
##D # Model 11: Rasch model
##D mod11 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D              pid=dat$idstud, name="mod11")
##D summary(mod11)
##D # read show file
##D shw11 <- sirt::read.show( "mod11.shw" )
##D # read person-item map
##D pi11 <- sirt::read.pimap(showfile="mod11.shw")
##D 
##D #***
##D # Model 12: Rasch model with fixed item difficulties (from Model 1)
##D mod12 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D              pid=dat$idstud, constraints=mod11$item[, c("item","itemdiff")],
##D              name="mod12")
##D summary(mod12)
##D 
##D #***
##D # Model 13: Latent regression model with predictors female, hisei and migra
##D mod13a <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D              pid=dat$idstud, X=dat[, c("female", "hisei", "migra") ],
##D              name="mod13a")
##D summary(mod13a)
##D 
##D # latent regression with a subset of predictors
##D mod13b <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D              pid=dat$idstud, X=dat[, c("female", "hisei", "migra") ],
##D              regression="hisei migra", name="mod13b")
##D 
##D #***
##D # Model 14: Differential item functioning (female)
##D mod14 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D              pid=dat$idstud, X=dat[, c("female"), drop=FALSE],
##D              model="item+female+item*female",  regression="",  name="mod14")
##D 
##D #############################################################################
##D # EXAMPLE 2: Polytomous data (data.Students)
##D #############################################################################
##D library(CDM)
##D data(data.Students)
##D dat <- data.Students
##D 
##D # select items
##D items <- grep.vec( "act", colnames(dat) )$x
##D 
##D #***
##D # Model 21: Partial credit model
##D mod21 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D               model="item+item*step",  name="mod21")
##D 
##D #***
##D # Model 22: Rating scale model
##D mod22 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D               model="item+step", name="mod22")
##D 
##D #***
##D # Model 23: Multidimensional model
##D items <- grep.vec( c("act", "sc" ), colnames(dat),  "OR" )$x
##D qmatrix <- matrix( 0, nrow=length(items), 2 )
##D qmatrix[1:5,1] <- 1
##D qmatrix[6:9,2] <- 1
##D mod23 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D             model="item+item*step", qmatrix=qmatrix, name="mod23")
##D 
##D #############################################################################
##D # EXAMPLE 3: Multi facet models (data.ratings1)
##D #############################################################################
##D library(sirt)
##D data(data.ratings1)
##D dat <- data.ratings1
##D 
##D items <- paste0("k",1:5)
##D 
##D # use numeric rater ID's
##D raters <- as.numeric( substring( paste( dat$rater ), 3 ) )
##D 
##D #***
##D # Model 31: Rater model 'item+item*step+rater'
##D mod31 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D               itemcodes=0:3, model="item+item*step+rater",
##D               pid=dat$idstud, X=data.frame("rater"=raters),
##D               regression="", name="mod31")
##D 
##D #***
##D # Model 32: Rater model 'item+item*step+rater+item*rater'
##D mod32 <- sirt::R2conquest(dat=dat[,items], path.conquest=path.conquest,
##D               model="item+item*step+rater+item*rater",
##D               pid=dat$idstud, X=data.frame("rater"=raters),
##D               regression="", name="mod32")
## End(Not run)



