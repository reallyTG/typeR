library(mrds)


### Name: stake78
### Title: Wooden stake data from 1978 survey
### Aliases: stake78
### Keywords: datasets

### ** Examples

## No test: 
data(stake78)
data(stake77)
# compare distribution of distances for all stakes
hist(stake77$PD)
hist(stake78$PD)
# Extract stake data and put in the mrds format for model fitting.
extract.stake <- function(stake,obs){
  extract.obs <- function(obs){
    example <- subset(stake,eval(parse(text=paste("Obs",obs,"==1",sep=""))),
                      select="PD")
    example$distance <- example$PD
    example$object <- 1:nrow(example)
    example$PD <- NULL
    return(example)
  }
  if(obs!="all"){
     return(extract.obs(obs=obs))
  }else{
    example <- NULL
    for(i in 1:(ncol(stake)-2)){
      df <- extract.obs(obs=i)
      df$person <- i
      example <- rbind(example,df)
    }
    example$person <- factor(example$person)
    example$object <- 1:nrow(example)
    return(example)
  }
}
extract.stake.pairs <- function(stake,obs1,obs2,removal=FALSE){
  obs1 <- paste("Obs",obs1,sep="")
  obs2 <- paste("Obs",obs2,sep="")
  example <- subset(stake,eval(parse(text=paste(obs1,"==1 |",obs2,"==1 ",
                                     sep=""))), select=c("PD",obs1,obs2))
  names(example) <- c("distance","obs1","obs2")
  detected <- c(example$obs1,example$obs2)
  example <- data.frame(object=rep(1:nrow(example),2),
                        distance=rep(example$distance,2),
                        detected = detected,
                        observer=c(rep(1,nrow(example)),
                                   rep(2,nrow(example))))
  if(removal) example$detected[example$observer==2] <- 1
  return(example)
}

# extract data for observer 10 and fit a single observer model
stakes <- extract.stake(stake78,10)
ds.model <- ddf(dsmodel = ~mcds(key = "hn", formula = ~1), data = stakes,
                method = "ds", meta.data = list(width = 20))
plot(ds.model,breaks=seq(0,20,2),showpoints=TRUE)
ddf.gof(ds.model)

# extract data from observers 5 and 7 and fit an io model
stkpairs <- extract.stake.pairs(stake78,5,7,removal=FALSE)
io.model <- ddf(dsmodel = ~mcds(key = "hn", formula=~1),
                mrmodel=~glm(formula=~distance),
                data = stkpairs, method = "io")
summary(io.model)
par(mfrow=c(3,2))
plot(io.model,breaks=seq(0,20,2),showpoints=TRUE,new=FALSE)
ddf.gof(io.model)
## End(No test)




