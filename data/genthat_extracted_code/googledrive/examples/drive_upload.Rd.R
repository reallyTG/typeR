library(googledrive)


### Name: drive_upload
### Title: Upload into a new Drive file
### Aliases: drive_upload

### ** Examples

## Not run: 
##D ## upload a csv file
##D chicken_csv <- drive_upload(
##D   drive_example("chicken.csv"),
##D   "chicken-upload.csv"
##D )
##D 
##D ## or convert it to a Google Sheet
##D chicken_sheet <- drive_upload(
##D   drive_example("chicken.csv"),
##D   name = "chicken-sheet-upload.csv",
##D   type = "spreadsheet"
##D )
##D 
##D ## check out the new Sheet!
##D drive_browse(chicken_sheet)
##D 
##D ## clean-up
##D drive_find("chicken.*upload") %>% drive_rm()
##D 
##D ## Upload a file and, at the same time, star it
##D chicken <- drive_upload(
##D   drive_example("chicken.jpg"),
##D   starred = "true"
##D )
##D 
##D ## Is is really starred? YES
##D purrr::pluck(chicken, "drive_resource", 1, "starred")
##D 
##D ## Clean up
##D drive_rm(chicken)
##D 
##D ## Upload to a Team Drive:
##D ##   * your Google account must have Team Drive privileges, obviously
##D ##   * the Team Drive (or Team Drive-hosted folder) MUST be captured as a
##D ##     dribble first and provided via `path`
##D td <- team_drive_get("Marketing")
##D drive_upload("fascinating.csv", path = td)
## End(Not run)



