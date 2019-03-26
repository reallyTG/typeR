library(ideq)


### Name: dstm_eof
### Title: Dynamic spatio-temporal model with EOFs
### Aliases: dstm_eof

### ** Examples

# Load example data
data("ide_standard")

# Illustrate methods
rw_model <- dstm_eof(ide_standard, proc_model="RW", verbose=TRUE)
summary(rw_model)
predict(rw_model) 

# Other model types
dstm_eof(ide_standard, proc_model="AR") # Diagonal process matrix
dstm_eof(ide_standard, proc_model="Dense") # Dense process matrix

# Specify hyperparameters
P <- 4
dstm_eof(ide_standard, sample_sigma2=FALSE, proc_error="Discount", P=P,
         params=list(sigma2=0.01, alpha_lambda=201, beta_lambda=20))
         
dstm_eof(ide_standard, P=P,
         params=list(m_0=rep(1, P), C_0=diag(0.01, P),
                     scale_W=diag(P), df_W=100))



