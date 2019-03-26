library(censys)


### Name: censys_export_job_status
### Title: Get status of a Censys export job
### Aliases: censys_export_job_status

### ** Examples

## Not run: 
##D q <- censys_start_export("
##D SELECT location.country, count(ip) FROM ipv4.20161206 GROUP BY location.country
##D ")
##D censys_export_job_status(q$job_id)
##D censys_export_download(q$job_id, "~/Data")
## End(Not run)



