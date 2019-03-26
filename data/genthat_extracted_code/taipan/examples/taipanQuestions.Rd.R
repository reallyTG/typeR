library(taipan)


### Name: taipanQuestions
### Title: Prepare a set of questions for taipan
### Aliases: taipanQuestions

### ** Examples

## Not run: 
##D 
##D questions <- taipanQuestions(
##D   scene = div(radioButtons("graphic", label = "2D Graphic",
##D                            choices = list("Live image", "2D Graphic")),
##D               radioButtons("bg", label = "Background",
##D                            choices = list("Crowd",
##D                                           "Court", "Logo wall", "Not applicable")),
##D               radioButtons("person", label = "Detectable Person",
##D                            choices = list("Yes", "No")),
##D               radioButtons("shotangle", label = "Shot angle",
##D                            choices = list("Level with players",
##D                                           "Birds eye",
##D                                           "Upward angle")),
##D               radioButtons("situation", label = "Situation",
##D                            choices = list("Court in play",
##D                                           "Court player close-up",
##D                                           "Court close-up not player",
##D                                           "Crowd",
##D                                           "Off court close up of player",
##D                                           "Transition"))),
##D   selection = div(radioButtons("detect", label = "Detect Face",
##D                                choices = list("Player" ,
##D                                               "Other staff on court", "Fan", "None")),
##D                   radioButtons("obscured", label = "Face obscured",
##D                                choices = list("Yes", "No")),
##D                   radioButtons("lighting", label = "Lighting",
##D                                choices = list("Direct sunlight", "Shaded", "Partially shaded")),
##D                   radioButtons("headangle", label = "Head angle",
##D                                choices = list("Front on", "Back of head",
##D                                               "Profile", "Other")),
##D                   radioButtons("glasses", label = "Glasses",
##D                                choices = list("Yes", "No")),
##D                   radioButtons("visorhat", label = "Visor/hat",
##D                                choices = list("Yes", "No")))
##D )
## End(Not run)




