library(arc)


### Name: cba
### Title: CBA Classifier
### Aliases: cba

### ** Examples

 # Example using automatic threshold detection
  cba(datasets::iris, "Species", rulelearning_options = list(target_rule_count = 50000))
 # Example using manually set confidence and support thresholds
  rm <- cba(datasets::iris, "Species", rulelearning_options = list(minsupp=0.01,
   minconf=0.5, minlen=1, maxlen=5, maxtime=1000, target_rule_count=50000, trim=TRUE,
   find_conf_supp_thresholds=FALSE))
  inspect(rm@rules)



