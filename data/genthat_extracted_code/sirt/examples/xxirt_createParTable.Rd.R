library(sirt)


### Name: xxirt_createParTable
### Title: Create Item Response Functions and Item Parameter Table
### Aliases: xxirt_createParTable xxirt_createDiscItem xxirt_modifyParTable

### ** Examples

#############################################################################
## EXAMPLE 1: Definition of item response functions
#############################################################################

data(data.read)
dat <- data.read

#------ Definition of item response functions
#*** IRF 2PL
P_2PL <- function( par, Theta, ncat){
    a <- par[1]
    b <- par[2]
    TP <- nrow(Theta)
    P <- matrix( NA, nrow=TP, ncol=ncat)
    P[,1] <- 1
    for (cc in 2:ncat){
        P[,cc] <- exp( (cc-1) * a * Theta[,1] - b )
    }
    P <- P / rowSums(P)
    return(P)
}

#*** IRF 1PL
P_1PL <- function( par, Theta, ncat){
    b <- par[1]
    TP <- nrow(Theta)
    par0 <- c(1,b)
    P <- P_2PL( par=par0, Theta=Theta, ncat=ncat)
    return(P)
}

#** created item classes of 1PL and 2PL models
par <- c( "a"=1, "b"=0 )
# define some slightly informative prior of 2PL
item_2PL <- sirt::xxirt_createDiscItem( name="2PL", par=par, est=c(TRUE,TRUE),
                P=P_2PL, prior=c( a="dlnorm"), prior_par1=c(a=0),
                prior_par2=c(a=5) )
item_1PL <- sirt::xxirt_createDiscItem( name="1PL", par=par[2], est=c(TRUE),
                P=P_1PL )
# list of item classes in customItems
customItems <- list( item_1PL,  item_2PL )

#-- create parameter table
itemtype <- rep( "1PL", 12 )
partable <- sirt::xxirt_createParTable(dat, itemtype=itemtype, customItems=customItems)
# privide starting values
partable1 <- sirt::xxirt_modifyParTable( partable, parname="b",
                   value=- stats::qlogis( colMeans(dat) ) )
# equality constraint of parameters and definition of lower bounds
partable1 <- sirt::xxirt_modifyParTable( partable1, item=c("A1","A2"),
                parname="b", parindex=110, lower=-1, value=0)
print(partable1)



