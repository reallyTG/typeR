library(FSA)


### Name: wrAdd
### Title: Computes a vector of relative weights specific to a species in
###   an entire data frame.
### Aliases: wrAdd wrAdd.default wrAdd.formula
### Keywords: manip

### ** Examples

## Create random data for three species
# just to control the randomization
set.seed(345234534)
dbt <- data.frame(species=factor(rep(c("Bluefin Tuna"),30)),tl=round(rnorm(30,1900,300),0))
dbt$wt <- round(4.5e-05*dbt$tl^2.8+rnorm(30,0,6000),1)
dbg <- data.frame(species=factor(rep(c("Bluegill"),30)),tl=round(rnorm(30,130,50),0))
dbg$wt <- round(4.23e-06*dbg$tl^3.316+rnorm(30,0,10),1)
dlb <- data.frame(species=factor(rep(c("Largemouth Bass"),30)),tl=round(rnorm(30,350,60),0))
dlb$wt <- round(2.96e-06*dlb$tl^3.273+rnorm(30,0,60),1)
df <- rbind(dbt,dbg,dlb)
str(df)

df$Wr1 <- wrAdd(wt~tl+species,data=df)
## same but with non-formula interface
df$Wr2 <- wrAdd(df$wt,df$tl,df$species)

## Same as above but using dplyr
if (require(dplyr)) {
  df <- mutate(df,Wr3a=wrAdd(wt,tl,species))
}

df
 
## Example with only one species in the data.frame
bg <- Subset(df,species=="Bluegill")
bg$Wr4 <- wrAdd(wt~tl+species,data=bg)




