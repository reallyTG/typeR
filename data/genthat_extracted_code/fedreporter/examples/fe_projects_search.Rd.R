library(fedreporter)


### Name: fe_projects_search
### Title: Search Federal RePORTER Projects
### Aliases: fe_projects_search

### ** Examples

res = fe_projects_search(
project_number = "USFS*",
fiscal_year = 2012)
res = fe_projects_search(
project_number = "*R01*",
fiscal_year = 2012,
agency = "NIH",
text = "stroke",
text_field = "title")

## Not run: 
##D res = fe_projects_search(pi_name = "MATSUI, ELIZABETH")
##D items = res$content$items
##D con_pis = sapply(items, "[[", "contactPi")
##D keep = grepl("^MATSUI", con_pis)
##D items = items[keep]
##D mat_costs = sapply(items, "[[", "totalCostAmount")
##D sum(mat_costs)
##D 
##D res = fe_projects_search(pi_name = "PENG, ROGER")
##D items = res$content$items
##D con_pis = sapply(items, "[[", "contactPi")
##D keep = grepl("^PENG", con_pis)
##D items = items[keep]
##D peng_costs = sapply(items, "[[", "totalCostAmount")
##D sum(peng_costs)
##D 
##D both = fe_projects_search(
##D pi_name = c("MATSUI, ELIZABETH", "PENG, ROGER"))
## End(Not run)



