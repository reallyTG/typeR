library(rbraries)


### Name: projects
### Title: Projects
### Aliases: projects lio_project lio_project_dependencies
###   lio_project_dependents lio_project_dependent_repos
###   lio_project_contribs lio_project_sourcerank lio_project_search

### ** Examples

## Not run: 
##D # project summary
##D lio_project('npm', 'grunt')
##D 
##D # dependencies
##D lio_project_dependencies('npm', 'grunt')
##D lio_project_dependencies('npm', 'grunt', '1.0.1')
##D 
##D # dependents
##D lio_project_dependents('npm', 'grunt')
##D lio_project_dependents('npm', 'grunt', per_page = 3)
##D 
##D # dependent repositories
##D lio_project_dependent_repos('npm', 'turf')
##D 
##D # project contributors
##D lio_project_contribs('npm', 'turf')
##D 
##D # source rank
##D lio_project_sourcerank('npm', 'turf')
##D 
##D # search
##D lio_project_search(q = 'grunt', per_page = 3)
## End(Not run)



