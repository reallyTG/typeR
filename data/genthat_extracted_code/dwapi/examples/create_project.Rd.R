library(dwapi)


### Name: create_project
### Title: Create a new project.
### Aliases: create_project

### ** Examples

request <- dwapi::project_create_request(
  title='testproject', visibility = 'OPEN',
  objective = 'Test project by R-SDK', tags = c('rsdk', 'sdk', 'arr'),
  license = 'Public Domain')

request <- dwapi::add_file(request = request, name = 'file4.csv',
  url = 'https://data.world/file4.csv')

## Not run: 
##D dwapi::create_project(create_project_req = request,
##D   owner_id = 'user')
## End(Not run)



