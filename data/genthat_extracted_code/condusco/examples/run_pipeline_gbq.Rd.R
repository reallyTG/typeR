library(condusco)


### Name: run_pipeline_gbq
### Title: A wrapper for running pipelines with a BigQuery invocation query
### Aliases: run_pipeline_gbq

### ** Examples


## Not run: 
##D library(whisker)
##D 
##D #Set GBQ project
##D project <- ''
##D 
##D #Set the following options for GBQ authentication on a cloud instance
##D options("httr_oauth_cache" = "~/.httr-oauth")
##D options(httr_oob_default=TRUE)
##D 
##D #Run the below query to authenticate and write credentials to .httr-oauth file
##D query_exec("SELECT 'foo' as bar",project=project);
##D 
##D pipeline <- function(params){
##D 
##D   query <- "
##D     SELECT
##D       {{#list}}
##D         SUM(CASE WHEN author.name ='{{name}}' THEN 1 ELSE 0 END) as n_{{name_clean}},
##D       {{/list}}
##D       repo_name
##D     FROM `bigquery-public-data.github_repos.sample_commits`
##D     GROUP BY repo_name
##D   ;"
##D 
##D   res <- query_exec(
##D     whisker.render(query,params),
##D     project=project,
##D     use_legacy_sql = FALSE
##D   );
##D 
##D   print(res)
##D }
##D 
##D run_pipeline_gbq(pipeline, "
##D   SELECT CONCAT('[',
##D   STRING_AGG(
##D     CONCAT('{\"name\":\"',name,'\",'
##D       ,'\"name_clean\":\"', REGEXP_REPLACE(name, r'[^[:alpha:]]', ''),'\"}'
##D     )
##D   ),
##D   ']') as list
##D   FROM (
##D     SELECT author.name,
##D       COUNT(commit) n_commits
##D     FROM `bigquery-public-data.github_repos.sample_commits`
##D     GROUP BY 1
##D     ORDER BY 2 DESC
##D     LIMIT 10
##D   )
##D ",
##D project,
##D use_legacy_sql = FALSE
##D )
## End(Not run)



