library(dwapi)


### Name: replace_project
### Title: Create a new project with a specific ID, replacing a project
###   with that ID if it exists.
### Aliases: replace_project

### ** Examples

request <- dwapi::project_replace_request(
  title='testproject', visibility = 'OPEN',
  objective = 'Test project by R-SDK', tags = c('rsdk', 'sdk', 'arr'),
  license = 'Public Domain')

request <- dwapi::add_file(request = request, name = 'file4.csv',
  url = 'https://data.world/file4.csv')

## Not run: 
##D dwapi::replace_project(create_project_req = request,
##D   owner_id = 'user', project_id = 'projectid')
## End(Not run)



