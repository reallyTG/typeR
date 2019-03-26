library(kutils)


### Name: likert
### Title: Percentage tables for Likert Scale variables
### Aliases: likert

### ** Examples

vvector <- c("Strongly Disagree", "Disagree", "Neutral",
              "Agree", "Strongly Agree")
set.seed(2342234)
N <- 28
scales <-
    data.frame(Vegas = factor(sample(1:5, N, replace = TRUE),
        levels = 1:5, labels = vvector),
               NewYork = factor(sample(1:5, N, replace = TRUE),
        levels = 1:5, labels = vvector),
               Paris = factor(sample(1:5, N, replace = TRUE),
        levels = 1:5, labels = vvector),
               Berlin = factor(sample(1:5, N, replace = TRUE),
        levels = 1:5, labels = vvector))

likert(scales)

likert(scales, exclude = "Disagree")

likert(scales, exclude = "Strongly Disagree", useNA = "ifany")

(mySummary1 <- likert(data = scales, vlist = c("Vegas", "NewYork", "Paris")))
mySummary1[["pcts"]]

(mySummary2 <- likert(scales, vlist = c("Vegas", "NewYork", "Paris"),
                    valuelabels = c("SD", "D", "N", "A", "SA")))
(mySummary3 <- likert(scales, vlist = c("Vegas", "NewYork", "Paris"),
                    valuelabels = c("Strongly Disagree" = "Strong Disagreement")))

(mySummary5 <- likert(scales, vlist = c("Vegas", "NewYork", "Paris"),
      valuelabels = c("SD", "D", "N", "A", "SA"),
      columnlabels = c("Vegas" = "Sin City"), rows = TRUE))

 ## Example of how one might write this in a file. 
 ## print(xtable::xtable(mySummary1[[1]], digits = 1),
 ##       type = "html", file = "varCount-1.html")       
  



