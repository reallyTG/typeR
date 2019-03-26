# Just for testing, do not use this.
gaussian.trees.e.step <- function(X, S) {
  v = nrow(S)
  m = ncol(X)
  n = nrow(X)

  latentFirstMoments = S[(m + 1):v, 1:m] %*% solve(S[1:m, 1:m]) %*% t(X)
  schurComplement = S[(m + 1):v, (m + 1):v] - S[(m + 1):v, 1:m] %*% solve(S[1:m, 1:m], S[1:m, (m +
                                                                                                 1):v])
  latentFirstMomentCovarianceSum = latentFirstMoments %*% t(latentFirstMoments)
  latentSecondMomentsSum = schurComplement + 1 / n * latentFirstMomentCovarianceSum
  return(list(latentFirstMoments, latentSecondMomentsSum))
}

# Just for testing, do not use this.
gaussian.trees.m.step <- function(latentFirstMoments, latentSecondMomentsSum, X,
           edges, supp) {
    if (is.vector(edges)) {
      edges = t(matrix(edges, 2, length(edges) / 2))
    }

    n = dim(X)[1]
    m = dim(X)[2]
    v = 2 * m - 2

    Sigma11 = 1 / n * t(X) %*% X
    Sigma12 = 1 / n * t(latentFirstMoments %*% X)
    Sigma22 = latentSecondMomentsSum
    Sigma = rbind(cbind(Sigma11, Sigma12), cbind(t(Sigma12), Sigma22))
    edgeCorrelations = rep(0, length(supp))

    if (dim(edges)[1] > 0) {
      for (i in 1:(dim(edges)[1])) {
        if (supp[i] == 1) {
          edgeCorrelations[i] = Sigma[edges[i, 1], edges[i, 2]] / sqrt(Sigma[edges[i, 1], edges[i, 1]] *
                                                                         Sigma[edges[i, 2], edges[i, 2]])
        }
      }
    }
    return(getCovMat(edgeCorrelations, edges, v))
  }
