library(FSA)


### Name: psdAdd
### Title: Creates a vector of Gabelhouse lengths for each species in an
###   entire data frame.
### Aliases: psdAdd psdAdd.default psdAdd.formula
### Keywords: manip

### ** Examples

## Create random data for three species
# only for repeatability
set.seed(345234534)
dbg <- data.frame(species=factor(rep(c("Bluegill"),30)),tl=round(rnorm(30,130,50),0))
dbg$wt <- round(4.23e-06*dbg$tl^3.316+rnorm(30,0,10),1)
dlb <- data.frame(species=factor(rep(c("Largemouth Bass"),30)),tl=round(rnorm(30,350,60),0))
dlb$wt <- round(2.96e-06*dlb$tl^3.273+rnorm(30,0,60),1)
dbt <- data.frame(species=factor(rep(c("Bluefin Tuna"),30)),tl=round(rnorm(30,1900,300),0))
dbt$wt <- round(4.5e-05*dbt$tl^2.8+rnorm(30,0,6000),1)
df <- rbind(dbg,dlb,dbt)
str(df)

## Examples (non-dplyr)
# Add variable using category names -- formula notation
df$PSD <- psdAdd(tl~species,data=df)
head(df)
# Add variable using category names -- non-formula notation
df$PSD1 <- psdAdd(df$tl,df$species)
head(df)
# Add variable using length values as names
df$PSD2 <- psdAdd(tl~species,data=df,use.names=FALSE)
head(df)
# Add additional length and name for Bluegill
df$PSD3 <- psdAdd(tl~species,data=df,addSpec="Bluegill",addLens=175)
head(df)
# Add additional lengths and names for Bluegill and Largemouth Bass from a data.frame
addls <- data.frame(species=c("Bluegill","Largemouth Bass","Largemouth Bass"),
                    lens=c(175,254,356))
df$psd4 <- psdAdd(tl~species,data=df,addSpec=addls$species,addLens=addls$lens)
head(df)

## All of the above but using dplyr
if (require(dplyr)) {
  df <- df %>%
    mutate(PSD1A=psdAdd(tl,species)) %>%
    mutate(PSD2A=psdAdd(tl,species,use.names=FALSE)) %>%
    mutate(psd3a=psdAdd(tl,species,addSpec="Bluegill",addLens=175)) %>%
    mutate(psd4a=psdAdd(tl,species,addSpec=addls$species,addLens=addls$lens))
}
df




