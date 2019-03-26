library(googledrive)


### Name: team_drive_rm
### Title: Delete Team Drives
### Aliases: team_drive_rm

### ** Examples

## Not run: 
##D ## Create Team Drives to remove in various ways
##D team_drive_create("testdrive-01")
##D td02 <- team_drive_create("testdrive-02")
##D team_drive_create("testdrive-03")
##D td04 <- team_drive_create("testdrive-04")
##D 
##D ## remove by name
##D team_drive_rm("testdrive-01")
##D ## remove by id
##D team_drive_rm(as_id(td02))
##D ## remove by URL (or, rather, id found in URL)
##D team_drive_rm(as_id("https://drive.google.com/drive/u/0/folders/Q5DqUk9PVA"))
##D ## remove by dribble
##D team_drive_rm(td04)
## End(Not run)



