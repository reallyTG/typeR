library(fauxpas)


### Name: Error-Classes
### Title: Individual error classes
### Aliases: Error-Classes HTTPContinue HTTPSwitchProtocol HTTPProcessing
###   HTTPOK HTTPCreated HTTPAccepted HTTPNonAuthoritativeInformation
###   HTTPNoContent HTTPResetContent HTTPPartialContent HTTPMultiStatus
###   HTTPAlreadyReported HTTPImUsed HTTPMultipleChoices
###   HTTPMovedPermanently HTTPFound HTTPSeeOther HTTPNotModified
###   HTTPUseProxy HTTPSwitchProxy HTTPTemporaryRedirect
###   HTTPPermanentRedirect HTTPBadRequest HTTPUnauthorized
###   HTTPPaymentRequired HTTPForbidden HTTPNotFound HTTPMethodNotAllowed
###   HTTPNotAcceptable HTTPProxyAuthenticationRequired HTTPRequestTimeout
###   HTTPConflict HTTPGone HTTPLengthRequired HTTPPreconditionFailed
###   HTTPRequestEntityTooLarge HTTPRequestURITooLong
###   HTTPUnsupportedMediaType HTTPRequestRangeNotSatisfiable
###   HTTPExpectationFailed HTTPTeaPot HTTPAuthenticationTimeout
###   HTTPMethodFailure HTTPUnprocessableEntity HTTPLocked
###   HTTPFailedDependency HTTPUnorderedCollection HTTPUpgradeRequired
###   HTTPPreconditionRequired HTTPTooManyRequests
###   HTTPRequestHeaderFieldsTooLarge HTTPLoginTimeout HTTPNoResponse
###   HTTPRetryWith HTTPBlockedByWindowsParentalControls
###   HTTPUnavailableForLegalReasons HTTPRequestHeaderTooLarge
###   HTTPCertError HTTPNoCert HTTPHTTPToHTTPS HTTPTokenExpiredInvalid
###   HTTPClientClosedRequest HTTPInternalServerError HTTPNotImplemented
###   HTTPBadGateway HTTPServiceUnavailable HTTPGatewayTimeout
###   HTTPHTTPVersionNotSupported HTTPVariantAlsoNegotiates
###   HTTPInsufficientStorage HTTPLoopDetected HTTPBandwidthLimitExceeded
###   HTTPNotExtended HTTPNetworkAuthenticationRequired
###   HTTPNetworkReadTimeoutError HTTPNetworkConnectTimeoutError
### Keywords: datasets

### ** Examples

if (requireNamespace("crul")) {

 library("crul")
 res <- HttpClient$new("https://httpbin.org/status/414")$get()
 x <- HTTPRequestURITooLong$new()
 x
 ## Not run: 
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)

 # behavior
 x <- HTTPRequestURITooLong$new(behavior = "warning")
 ## Not run: 
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)

 x <- HTTPRequestURITooLong$new(behavior = "message")
 ## Not run: 
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)

 # with message template
 (x <- HTTPRequestURITooLong$new(
   message_template = "{{reason}} ............ {{status}}",
   message_template_verbose = "{{reason}} .>.>.>.>.>.> {{status}}\n {{message}}"
 ))
 ## Not run: 
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)
}




