library(emIRT)


### Name: dynIRT
### Title: Dynamic IRT estimation via Variational Inference
### Aliases: dynIRT
### Keywords: multivariate

### ** Examples


### Replication of Martin-Quinn Judicial Ideology Scores
### Based on July 23, 2014 (2014 Release 01) release of the Supreme Court Database
### Start values and priors based on replication code provided by Kevin Quinn

data(mq_data)

## Estimate dynamic variational model using dynIRT()
lout <- dynIRT(.data = mq_data$data.mq,
                    .starts = mq_data$cur.mq,
                    .priors = mq_data$priors.mq,
                    .control = {list(
                    threads = 1,
                    verbose = TRUE,
                    thresh = 1e-6,
		    maxit=500
                    )})

## Extract estimate from variational model
## Delete point estimates of 0, which are justices missing from that session
vi.out <- c(t(lout$means$x))
vi.out[vi.out==0] <- NA
vi.out <- na.omit(vi.out)

## Compare correlation against MCMC-estimated result
## Correlates at r=0.93 overall, and 0.96 when excluding Douglas
cor(vi.out, mq_data$mq_mcmc)	
cor(vi.out[mq_data$justiceName != "Douglas"],
 mq_data$mq_mcmc[mq_data$justiceName != "Douglas"])	





