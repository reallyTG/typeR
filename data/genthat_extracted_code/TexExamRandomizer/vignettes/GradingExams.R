## ----echo=TRUE-----------------------------------------------------------
    system.file("exec", package = "TexExamRandomizer")

## ----echo=FALSE----------------------------------------------------------
library(knitr)
responses.file <- system.file("extdata", "ExampleTables", "ExampleResponses.csv", package = "TexExamRandomizer")
responsesTable <- read.csv(responses.file, header = TRUE)
responsesTable$ExtraPoints <- sample.int(10, size = nrow(responsesTable), replace = TRUE)
kable(responsesTable[1:5,], caption = "Example responses format")


## ----echo=FALSE----------------------------------------------------------
library(knitr)
answer.file <- system.file("extdata", "ExampleTables", "ExampleAnswerSheet.csv", package = "TexExamRandomizer")
answersTable <- read.csv(answer.file, header = TRUE)
kable(answersTable[1:5,], caption = "Answer sheet, the last two rows must be named \"choice\" and \"CorrectChoice\"")


## ----echo=FALSE----------------------------------------------------------
library(knitr)
graded.file <- system.file("extdata", "ExampleTables", "Example_Graded.csv", package = "TexExamRandomizer")
gradedTable <- read.csv(graded.file, header = TRUE)
kable(gradedTable[1:5,], caption = "Output graded file")


## ----echo=FALSE----------------------------------------------------------
library(knitr)
stats.file <- system.file("extdata", "ExampleTables", "Example_Stats.csv", package = "TexExamRandomizer")
statsTable <- read.csv(stats.file, header = TRUE)
kable(statsTable[1:5,], caption = "Output stats (It simply counts how many times each choice was chosen by every student)")


