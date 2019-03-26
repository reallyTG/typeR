library(Rsmlx)


### Name: setSettings
### Title: Easy tuning of the settings of a Monolix project
### Aliases: setSettings

### ** Examples

# RsmlxDemo1.mlxtran is a Monolix project for modelling the PK of warfarin.
# All settings of the projectare set so that algorithms used by Monolix converge as 
# quickly as possible possible:
setSettings(project="RsmlxDemo1.mlxtran", level=1)

# A new project will be created with settings set in order to obtain the most 
# precise results possible:
new.project= file.path(tempdir(),"RsmlxDemoNew.mlxtran")
setSettings(project="RsmlxDemo1.mlxtran", new.project=new.project, level=9)

# See http://rsmlx.webpopix.org/userguide/setSettings/ for detailed examples of use of setSettings
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



