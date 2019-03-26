library(LSAfun)


### Name: MultipleChoice
### Title: Answers Multiple Choice Questions
### Aliases: MultipleChoice

### ** Examples
data(wonderland)

LSAfun:::MultipleChoice("Who does the march hare celebrate his unbirthday with?",
                 c("Mad Hatter","Red Queen","Caterpillar","Cheshire Cat"),
                 tvectors=wonderland,breakdown=TRUE)


