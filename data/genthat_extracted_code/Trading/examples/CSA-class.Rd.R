library(Trading)


### Name: CSA-class
### Title: CSA Class
### Aliases: CSA

### ** Examples



  csa_raw = read.csv(system.file("extdata", "CSA.csv", package = "Trading"),
  header=TRUE,stringsAsFactors = FALSE)

csas = list()
for(i in 1:nrow(csa_raw))
{
 csas[[i]] = CSA()
 csas[[i]]$PopulateViaCSV(csa_raw[i,])
}



