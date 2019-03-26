library(BayesDA)


### Name: personality
### Title: Personality Data From an Experiment in Psychology
### Aliases: personality
### Keywords: datasets

### ** Examples

data(personality)
str(personality)
# Following code adapted from file personality3.R on the book's webpage:
nsubjects <- 6
nrep <- 7

test <- function (a){
  output <- as.vector(a)>0
  glm.data.frame <- data.frame (output, response, situation, person)
  glm0 <- glm (output ~
    factor(response) + factor(situation) + factor(person),
    family=binomial(link=logit),
    data=glm.data.frame)
  pred0 <- predict.glm (glm0, type="response")
  mean (ifelse(output, (1-pred0)^2, pred0^2))
}
data <- personality[,,1:nsubjects]
attrs <- attributes(data)
data <- ifelse (data>0, 1, 0)
attributes(data) <- attrs




