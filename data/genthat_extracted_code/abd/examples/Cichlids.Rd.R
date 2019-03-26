library(abd)


### Name: Cichlids
### Title: Cichlid Mating Preference
### Aliases: Cichlids
### Keywords: datasets

### ** Examples

str(Cichlids)

summary(preference ~ genotype, Cichlids, fun = favstats)

if (require(plyr)) {
ddply(Cichlids, .(genotype),
  function(df)c(mean = mean(df$preference),
                standard.deviation = sd(df$preference),
                n = length(df$preference)))
}



