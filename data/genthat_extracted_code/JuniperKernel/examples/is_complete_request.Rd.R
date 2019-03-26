library(JuniperKernel)


### Name: is_complete_request
### Title: Is Complete Handler
### Aliases: is_complete_request

### ** Examples

## Not run: 
##D   request_msg <- list(code="print(")  'incomplete'
##D   is_complete_request(request_msg)
## End(Not run)

## Not run: 
##D   request_msg <- list(code="print(5)")  # 'complete'
##D   is_complete_request(request_msg)
## End(Not run)




