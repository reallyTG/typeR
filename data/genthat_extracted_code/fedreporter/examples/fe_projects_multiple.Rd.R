library(fedreporter)


### Name: fe_projects_multiple
### Title: Fetch multiple projects by internal Federal RePORTER IDs (SM ID
###   or Project Numbers)
### Aliases: fe_projects_multiple

### ** Examples

res = fe_projects_multiple(
project_number = c("5R01MH092950-05", "USFS-0000779")
)
res = fe_projects_multiple(
internal_id = c("739576", "739577")
)



