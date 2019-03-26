library(FSAdata)


### Name: Menhaden1
### Title: Catch-at-age for Gulf Menhaden, 1964-2004.
### Aliases: Menhaden1
### Keywords: datasets

### ** Examples

data(Menhaden1)
str(Menhaden1)
head(Menhaden1)
ages <- 0:6
# Extract one year, delete year column (the -1), and transpose to be a vector
ct <- t(Menhaden1[Menhaden1$year==1974,-1])
plot(ct~ages,pch=16,type="b",xlab="Age",ylab="Est. Catch (Millions)",main="year==1974")




