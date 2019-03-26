library(idefix)


### Name: SurveyApp
### Title: Shiny application to generate a discrete choice survey.
### Aliases: SurveyApp

### ** Examples

## No test: 
#### Present choice design without adaptive sets (n.total = sets in des)
# example design 
data("example_design") # pregenerated design
xdes <- example_design
### settings of the design 
code <- c("D", "D", "D")
n.sets <- 8
# settings of the survey
alternatives <- c("Alternative A", "Alternative B")
attributes <- c("Price", "Time", "Comfort")
labels <- vector(mode="list", length(attributes))
labels[[1]] <- c("$10", "$5", "$1")
labels[[2]] <- c("20 min", "12 min", "3 min")
labels[[3]] <- c("bad", "average", "good")
i.text <- "Welcome, here are some instructions ... good luck!"
b.text <- "Please choose the alternative you prefer"
e.text <- "Thanks for taking the survey"
dataDir <- getwd()
# Display the survey 
SurveyApp (des = xdes, n.total = n.sets, alts = alternatives, 
          atts = attributes, lvl.names = labels, coding = code, 
          buttons.text = b.text, intro.text = i.text, end.text = e.text)

#### Present choice design with partly adaptive sets (n.total > sets in des)
# example design 
data("example_design") # pregenerated design
xdes <- example_design
### settings of the design 
code <- c("D", "D", "D")
n.sets <- 12
# settings of the survey
alternatives <- c("Alternative A", "Alternative B")
attributes <- c("Price", "Time", "Comfort")
labels <- vector(mode="list", length(attributes))
labels[[1]] <- c("$10", "$5", "$1")
labels[[2]] <- c("20 min", "12 min", "3 min")
labels[[3]] <- c("bad", "average", "good")
i.text <- "Welcome, here are some instructions ... good luck!"
b.text <- "Please choose the alternative you prefer"
e.text <- "Thanks for taking the survey"
# setting for adaptive sets 
levels <- c(3, 3, 3)
cand <- Profiles(lvls = levels, coding = code)
p.mean <- c(0.3, 0.7, 0.3, 0.7, 0.3, 0.7)
p.var <- diag(length(p.mean))
dataDir <- getwd()
# Display the survey 
SurveyApp(des = xdes, n.total = n.sets, alts = alternatives, atts = 
attributes, lvl.names = labels, coding = code, buttons.text = b.text, 
intro.text = i.text, end.text = e.text, crit= "DB", prior.mean = p.mean,
prior.covar = p.var, cand.set = cand, n = 50)

#### Choice design with only adaptive sets (des=NULL)
# setting for adaptive sets 
levels <- c(3, 3, 3)
p.mean <- c(0.3, 0.7, 0.3, 0.7, 0.3, 0.7)
low = c(-Inf, -Inf, -Inf, 0, 0, -Inf)
up = rep(Inf, length(p.mean))
p.var <- diag(length(p.mean)) 
code <- c("D", "D", "D")
cand <- Profiles(lvls = levels, coding = code)
n.sets <- 12
# settings of the survey
alternatives <- c("Alternative A", "Alternative B")
attributes <- c("Price", "Time", "Comfort")
labels <- vector(mode="list", length(attributes))
labels[[1]] <- c("$10", "$5", "$1")
labels[[2]] <- c("20 min", "12 min", "3 min")
labels[[3]] <- c("bad", "average", "good")
i.text <- "Welcome, here are some instructions ... good luck!"
b.text <- "Please choose the alternative you prefer"
e.text <- "Thanks for taking the survey"
dataDir <- getwd()
# Display the survey 
SurveyApp (des = NULL, n.total = n.sets, alts = alternatives, atts =
attributes, lvl.names = labels, coding = code, buttons.text = b.text,
intro.text = i.text, end.text = e.text, crit= "KL", prior.mean = p.mean,
prior.covar = p.var, cand.set = cand, lower = low, upper = up, n = 50) 


#### Present choice design with a no choice alternative.
# example design 
data("nochoice_design") # pregenerated design
xdes <- nochoice_design
### settings of the design 
code <- c("D", "D", "D")
n.sets <- 8
# settings of the survey
alternatives <- c("Alternative A", "Alternative B", "None")
attributes <- c("Price", "Time", "Comfort")
labels <- vector(mode = "list", length(attributes))
labels[[1]] <- c("$10", "$5", "$1")
labels[[2]] <- c("20 min", "12 min", "3 min")
labels[[3]] <- c("bad", "average", "good")
i.text <- "Welcome, here are some instructions ... good luck!"
b.text <- "Please choose the alternative you prefer"
e.text <- "Thanks for taking the survey"

SurveyApp (des = xdes, n.total = n.sets, alts = alternatives, 
          atts = attributes, lvl.names = labels, coding = code, 
          buttons.text = b.text, intro.text = i.text, end.text = e.text,
          no.choice = 3, alt.cte = c(0 , 0, 1))
## End(No test)



