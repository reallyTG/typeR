
# Simulate data for testing purposes
#
# Very, very, naive / unrealistic function used for simulating data.  It creates
# an msDat object and bioactivity matrix based on a given region and beta vector
# of regressors.  The data is unrealistic in that the mass spectrometry data is
# sampled from N(0, 1) distributions independent across both compounds and
# fractions, and hence does not have the structure characteristic of mass
# spectrometry intensities.
#
# @param nCmp number of mass spec compounds to similate
#
# @param nFrac number of mass spec fractions to simulate
#
# @param nRepl number of bioactivity replicates to simulate
#
# @param nPred number of compounds with nonzero association
#
# @param regIdx the region of interest (i.e. which fractions / cols)
#
# @param sigma the random noise (stand. dev.) when calculating X*beta + epsilon


simData <- function(nCmp, nFrac, nRepl, nPred, regIdx, sigma) {

    # Mass spec data as a (nCmp x nFrac) matrix, sampled as indepent N(0, 1)'s
    ms <- matrix(rnorm(nCmp * nFrac), nrow=nCmp, ncol=nFrac)
    colnames(ms) <- paste0("ms", seq_len(nFrac))

    # Define true beta (just the nonzero part of beta).  The first nPred values of
    # beta are the nonzero values (as specified by beta$idx), and the values of
    # beta are specified as 1, 1/2, 1/3, ..., 1/nPred.
    beta <- list(idx = seq_len(nPred),
                 val = seq(1, 1 / nPred, length.out=nPred) )

    # True mean for response, across the fractions (fractions with with
    # association that is, as specified by regIdx).  Arbitrarily chooses the first
    # nPred compounds to be the significant compounds.
    repl_mean <- drop( crossprod( ms[beta$idx, regIdx], beta$val ) )

    # Sample the response.  sapply, and hence in turn replicate, writes each
    # replicate as a column to a matrix.  Thus t yields a matrix with rows as
    # replicates and columns as fractions
    nfrac_assoc <- length(regIdx)
    bio_resp <- t( replicate(nRepl, repl_mean + rnorm(nfrac_assoc, sd=sigma)) )

    # Number of columns (fractions) before and after the region of interest
    nbef <- head(regIdx, 1L) - 1L
    naft <- nFrac - tail(regIdx, 1L)

    # Sample bioactivity matrix
    bio <- matrix(c(rnorm(nRepl * nbef),
                    bio_resp,
                    rnorm(nRepl * naft)),
                  nrow=nRepl,
                  ncol=nFrac )
    colnames(bio) <- paste0("bio", seq_len(nFrac))

    # Construct msDat object with arbitrary values provided for mtoz and charge
    msDat_out <- msDat(ms, seq_len(nCmp), rep(1L, nCmp))

    # Construct output object
    out <- list(msDatObj = msDat_out,
                bioact   = bio,
                region   = regIdx,
                beta     = beta )

    return (out)
}




