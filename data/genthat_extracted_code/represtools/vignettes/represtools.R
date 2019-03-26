## ----eval=FALSE----------------------------------------------------------
#  represtools::NewResearch("Baseball")

## ----eval=FALSE----------------------------------------------------------
#  represtools::Gather("Hitter")

## ----eval=FALSE----------------------------------------------------------
#  represtools::Cook("Hitters", inputFiles = c("Hitters", "Salaries"))

## ----eval=FALSE----------------------------------------------------------
#  represtools::Analyze("HitterPerformance", inputFiles = "Hitters")

## ----eval=FALSE----------------------------------------------------------
#  represtools::Present("Handedness"
#                       , inputFiles = "HitterPerformance"
#                       , title = "On the quality of right-handed batters"
#                       , output = "word_document")

## ----eval=FALSE----------------------------------------------------------
#  represtools::Make()

## ----eval=FALSE----------------------------------------------------------
#  represtools::NewResearch("Baseball")
#  represtools::Gather("Hitters")
#  # write some code
#  represtools::Cook("Hitters")
#  # write some code
#  represtools::Analyze("Handedness")
#  # write some code
#  represtools::Present("Handedness", title = "On the quality of right-handed batters", output = "html")
#  # write some code
#  represtools::Make()

## ----eval=FALSE----------------------------------------------------------
#  represtools::Gather("Japanese")
#  # write some code to gather
#  # edit the code in the "Hitters" cook module
#  
#  represtools::Make("clean")
#  represtools::Make()

