library(MTurkR)


### Name: CreateHIT
### Title: Create HIT
### Aliases: CreateHIT createhit create
### Keywords: HITs

### ** Examples

## Not run: 
##D ## CreateHIT using HITLayout from MTurk Requester User Interface ##
##D a <- GenerateLayoutParameter("message","Text to display in HIT")
##D hit1 <- CreateHIT(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW",
##D                   hitlayoutid = "23ZGOOGQSCM61T1H5H9U0U00OQWFFU", 
##D                   expiration = seconds(days = 4),
##D                   hitlayoutparameters = a)
##D 
##D ## CreateHIT using ExternalQuestion HIT URL ##
##D eq <- GenerateExternalQuestion("https://www.example.com/","400")
##D 
##D ### Specifying a HITTypeId ###
##D hit2 <- CreateHIT(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW", 
##D                   expiration = seconds(days = 4),
##D                   question = eq$string)
##D 
##D ### Creating a new HITTypeId atomically ###
##D hit3 <- CreateHIT(title = "Survey",
##D                   description = "5 question survey",
##D                   reward = ".10",
##D                   expiration = seconds(days = 4),
##D                   duration = seconds(hours = 1),
##D                   keywords = "survey, questionnaire",
##D                   question = eq$string)
##D 
##D ## CreateHIT using HTMLQuestion HIT Contents ##
##D f1 <- system.file("templates/htmlquestion1.xml", package = "MTurkR")
##D hq <- GenerateHTMLQuestion(file = f1)
##D hit4 <- CreateHIT(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW", 
##D                   expiration = seconds(days = 4),
##D                   question = hq$string)
##D 
##D ## CreateHIT using QuestionForm HIT Contents ##
##D f2 <- system.file("templates/tictactoe.xml", package = "MTurkR")
##D qf <- GenerateHTMLQuestion(file = f2)
##D hit5 <- CreateHIT(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW", 
##D                   expiration = seconds(days = 4),
##D                   question = qf$string)
##D 
##D 
##D ## Cleanup examples ##
##D ExpireHIT(hit1$HITId)
##D ExpireHIT(hit2$HITId)
##D ExpireHIT(hit3$HITId)
##D ExpireHIT(hit4$HITId)
##D ExpireHIT(hit5$HITId)
##D DisposeHIT(hit1$HITId)
##D DisposeHIT(hit2$HITId)
##D DisposeHIT(hit3$HITId)
##D DisposeHIT(hit4$HITId)
##D DisposeHIT(hit5$HITId)
## End(Not run)



