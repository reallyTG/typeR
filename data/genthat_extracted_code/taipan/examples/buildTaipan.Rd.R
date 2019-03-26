library(taipan)


### Name: buildTaipan
### Title: Build a taipan application
### Aliases: buildTaipan

### ** Examples

## Not run: 
##D library(taipan)
##D library(shiny)
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
##D 
##D 
##D images =
##D   c("https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/blue_player.png",
##D   "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/pink_player.png",
##D   "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/red_player.png",
##D   "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/yellow_player.png",
##D   "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/disgruntled_player.png")
##D 
##D 
##D buildTaipan(
##D   questions = questions,
##D   images = images,
##D   appdir = file.path(tempdir(), "taipan")
##D )
##D 
## End(Not run)




