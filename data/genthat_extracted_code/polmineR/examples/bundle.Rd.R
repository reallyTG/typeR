library(polmineR)


### Name: bundle-class
### Title: Bundle Class
### Aliases: bundle-class bundle name<-,bundle,character-method
###   length,bundle-method names,bundle-method names<-,bundle,vector-method
###   unique,bundle-method +,bundle,bundle-method +,bundle,textstat-method
###   [[,bundle-method [[<-,bundle-method $,bundle-method $<-,bundle-method
###   sample,bundle-method as.bundle,list-method as.bundle,textstat-method
###   as.data.table.bundle as.matrix,bundle-method subset,bundle-method
###   as.list,bundle-method

### ** Examples

parties <- s_attributes("GERMAPARLMINI", "party")
parties <- parties[-which(parties == "NA")]
party_bundle <- partition_bundle("GERMAPARLMINI", s_attribute = "party")
length(party_bundle)
names(party_bundle)
party_bundle <- enrich(party_bundle, p_attribute = "word")
summary(party_bundle)
parties_big <- party_bundle[[c("CDU_CSU", "SPD")]]
summary(parties_big)
p <- partition("GERMAPARLMINI", date = "2009-11-11")
pb <- partition_bundle(p, s_attribute = "party")
names(pb)
pb[["NA"]] <- NULL
names(pb)
pb <- partition_bundle("GERMAPARLMINI", s_attribute = "party")
pb$SPD # access partition names "SPD" in partition_bundle pb
pb <- partition_bundle("GERMAPARLMINI", s_attribute = "party")
pb$"NA" <- NULL # quotation needed if name is "NA"
use("polmineR")
Ps <- partition_bundle(
  "REUTERS", s_attribute = "id",
  values = s_attributes("REUTERS", "id")
)
Cs <- cooccurrences(Ps, query = "oil", cqp = FALSE, verbose = FALSE, progress = TRUE)
dt <- polmineR:::as.data.table.bundle(Cs, col = "ll")
m <- as.matrix(Cs, col = "ll")



