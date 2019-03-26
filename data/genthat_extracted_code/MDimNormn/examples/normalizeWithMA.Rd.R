library(MDimNormn)


### Name: normn MA
### Title: Multi-dimensional MA normalization for plate effect
### Aliases: normn_MA

### ** Examples

data(sba)
B <- normn_MA(sba$X, sba$plate)		# Multi-MA normalization

# MA-loess normalization
B <- normn_MA(sba$X, sba$plate, fitting_FUN= function(m_j, A) loess(m_j ~ A)$fitted)

# weighted linear regression normalization
B <- normn_MA(sba$X, sba$plate, fitting_FUN= function(m_j, A) {
	beta <- lm(m_j ~ A, weights= 1/A)$coefficients
	beta[1] + beta[2] * A
})

# robust linear regression normalization
if(any(search() == "package:MASS")) {	# excutable only when MASS package was loaded.
	B <- normn_MA(sba$X, sba$plate, fitting_FUN= function(m_j, A) {
		beta <- rlm(m_j ~ A, maxit= 100)$coefficients
		beta[1] + beta[2] * A
	})
}



