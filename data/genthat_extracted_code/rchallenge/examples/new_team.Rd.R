library(rchallenge)


### Name: new_team
### Title: Create new teams submission folders in your challenge.
### Aliases: new_team

### ** Examples

path <- tempdir()
wd <- setwd(path)
new_challenge()
new_team("team_foo", "team_bar")
setwd(wd)
unlink(path)



