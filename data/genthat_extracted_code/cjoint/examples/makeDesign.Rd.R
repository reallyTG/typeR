library(cjoint)


### Name: makeDesign
### Title: Create conjoint design
### Aliases: makeDesign

### ** Examples

data("immigrationconjoint")
## Not run: 
##D ## You can load a design from a .dat file from the Conjoint SDT
##D immigrationdesign <- makeDesign(type="file", filename="immigrant.dat")
## End(Not run)

## Or you can construct the conjoint design manually in in R
attribute_list <- list()
attribute_list[["Education"]] <-c("no formal","4th grade",
                                  "8th grade","high school",
                                  "two-year college","college degree",
                                  "graduate degree")
attribute_list[["Gender"]] <- c("female","male")
attribute_list[["Country of Origin"]] <-  c("Germany","France","Mexico",
                                            "Philippines","Poland","India",
                                            "China","Sudan","Somalia","Iraq")
attribute_list[["Reason for Application"]] <- c("reunite with family",
                                                "seek better job",
                                                "escape persecution")
attribute_list[["Job"]] <- c("janitor","waiter","child care provider",
                             "gardener","financial analyst",
                             "construction worker","teacher",
                             "computer programmer","nurse",
                             "research scientist","doctor")
attribute_list[["Job Experience"]] <- c("none","1-2 years",
                                        "3-5 years","5+ years")
attribute_list[["Job Plans"]] <- c("contract with employer",
                                   "interviews with employer", "will look for work",
                                   "no plans to look for work")
attribute_list[["Prior Entry"]] <- c("never","once as tourist",
                                     "many times as tourist","six months with family",
                                     "once w/o authorization")
attribute_list[["Language Skills"]] <- c("fluent English",
                                         "broken English",
                                         "tried English but unable",
                                         "used interpreter")

# Randomization constraints in the conjoint design
constraint_list <- list()
# Constraints on Education and Job attributes
# Cannot have "doctor" with "no formal" - "high school" education
constraint_list[[1]] <- list()
constraint_list[[1]][["Education"]] <- c("no formal","4th grade",
                                          "8th grade","high school")
constraint_list[[1]][["Job"]] <- c("financial analyst",
                                  "computer programmer","research scientist",
                                  "doctor")
# Constraints on Reason for Application/Country of Origin
constraint_list[[2]] <- list()
constraint_list[[2]][["Reason for Application"]] <- c("escape persecution")
constraint_list[[2]][["Country of Origin"]] <- c("Germany","France",
                                                "Mexico","Philippines",
                                                "Poland","India")

immigrationdesign <- makeDesign(type='constraints', attribute.levels=attribute_list,
                                constraints=constraint_list)

## You can set your own user-defined distribution over the attribute-levels
marginal_weights <- list() # Uniform for all except education which is bimodal
marginal_weights[["Education"]] <- c(1/20, 1/20, 2/10, 2/10, 1/10, 2/10, 2/10)
marginal_weights[["Gender"]] <- rep(1/length(attribute_list[["Gender"]]),
                                length(attribute_list[["Gender"]]))
marginal_weights[["Country of Origin"]] <- rep(1/length(
                                      attribute_list[["Country of Origin"]]),
                                      length(attribute_list[["Country of Origin"]]))
marginal_weights[["Reason for Application"]] <- rep(1/length(
                              attribute_list[["Reason for Application"]]),
                              length(attribute_list
                              [["Reason for Application"]]))
marginal_weights[["Job"]] <- rep(1/length(attribute_list[["Job"]]),
                              length(attribute_list[["Job"]]))
marginal_weights[["Job Experience"]] <- rep(1/length(attribute_list[["Job Experience"]]),
                                      length(attribute_list[["Job Experience"]]))
marginal_weights[["Job Plans"]] <- rep(1/length(attribute_list[["Job Plans"]]),
                                      length(attribute_list[["Job Plans"]]))
marginal_weights[["Prior Entry"]] <- rep(1/length(attribute_list[["Prior Entry"]]),
                                      length(attribute_list[["Prior Entry"]]))
marginal_weights[["Language Skills"]] <- rep(1/length(attribute_list[["Language Skills"]]),
                                      length(attribute_list[["Language Skills"]]))

## Not run: 
##D immigrationdesign_reweight <- makeDesign(type='constraints', attribute.levels=attribute_list,
##D                                 constraints=constraint_list, level.probs=marginal_weights)
##D 
##D ## Note that estimated AMCEs can depend on the randomization distribution
##D 
##D results <- amce(Chosen_Immigrant ~  Gender + Education + Job, data=immigrationconjoint,
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign)
##D summary(results)
##D 
##D results_wt <- amce(Chosen_Immigrant ~  Gender + Education + Job, data=immigrationconjoint,
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign_reweight)
##D summary(results_wt)
## End(Not run)



