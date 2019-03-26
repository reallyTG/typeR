library(censys)


### Name: censys_get_job_result
### Title: Get results of completed Censys SQL query job
### Aliases: censys_get_job_result

### ** Examples

## Not run: 
##D q <- censys_query("SELECT p443.https.tls.cipher_suite.name, count(ip) FROM ipv4
##D                    WHERE p443.https.tls.validation.browser_trusted=true
##D                    GROUP BY p443.https.tls.cipher_suite.name;")
##D censys_get_job_status(q$job_id)
##D censys_get_job_result(q$job_id)
## End(Not run)



