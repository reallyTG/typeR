library(googledrive)


### Name: team_drive_update
### Title: Update an existing Team Drive
### Aliases: team_drive_update

### ** Examples

## Not run: 
##D ## create a Team Drive
##D td <- team_drive_create("I love themes!")
##D 
##D ## see the themes available to you
##D themes <- drive_user(fields = "teamDriveThemes")$teamDriveThemes
##D purrr::map_chr(themes, "id")
##D 
##D ## cycle through various themes for this Team Drive
##D td <- team_drive_update(td, themeId = "bok_choy")
##D td <- team_drive_update(td, themeId = "cocktails")
##D 
##D ## clean up
##D team_drive_rm(td)
## End(Not run)



