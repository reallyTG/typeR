library(nlrx)


### Name: experiment
### Title: Construct a new experiment object
### Aliases: experiment

### ** Examples


# To attach an experiment, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

# Example for Wolf Sheep Predation model from NetLogo models library:
nl <- nl_simple
nl@experiment <- experiment(expname="wolf-sheep",
                             outpath="C:/out/",
                             repetition=1,
                             tickmetrics="true",
                             idsetup="setup",
                             idgo="go",
                             idfinal=NA_character_,
                             idrunnum=NA_character_,
                             runtime=50,
                             evalticks=seq(40,50),
                             stopcond="not any? turtles",
                             metrics=c("count sheep",
                                       "count wolves",
                                     "count patches with [pcolor = green]"),
                             metrics.turtles=list("turtles" = c("who",
                                               "pxcor",
                                               "pycor",
                                               "color")),
                             metrics.patches=c("pxcor", "pycor", "pcolor"),
                             variables = list('initial-number-sheep' =
                             list(min=50, max=150, step=10, qfun="qunif"),
                                              'initial-number-wolves' =
                             list(min=50, max=150, step=10, qfun="qunif")),
                             constants = list("model-version" =
                                              "\"sheep-wolves-grass\"",
                                              "grass-regrowth-time" = 30,
                                              "sheep-gain-from-food" = 4,
                                              "wolf-gain-from-food" = 20,
                                              "sheep-reproduce" = 4,
                                              "wolf-reproduce" = 5,
                                              "show-energy?" = "false"))





