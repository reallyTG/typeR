library(etm)


### Name: clos
### Title: Change in Length of Stay
### Aliases: clos clos.etm clos.msfit
### Keywords: survival

### ** Examples

data(los.data)

## putting los.data in the long format
my.observ <- prepare.los.data(x=los.data)

tra <- matrix(FALSE, 4, 4)
tra[1, 2:4] <- TRUE
tra[2, 3:4] <- TRUE

tr.prob <- etm(my.observ, c("0","1","2","3"), tra, NULL, 0)

cLOS <- etm::clos(tr.prob)
plot(cLOS)


### Compute bootstrapped SE

## function that performs the bootstrap
## nboot: number of bootstrap samples. Other arguments are as in etm()
boot.clos <- function(data, state.names, tra, cens.name, s = 0, nboot) {
    res <- double(nboot)
    for (i in seq_len(nboot)) {
        index <- sample(unique(data$id), replace = TRUE)
        inds <- new.id <- NULL
        for (j in seq_along(index)){
            ind <- which(data$id == index[j])
            new.id <- c(new.id, rep(j, length(ind)))
            inds <- c(inds, ind)
        }
        dboot <- cbind(data[inds, ], new.id)
        dboot[, which(names(dboot) == "id")]
        dboot$id <- dboot$new.id
        tr.prob <- etm(dboot, state.names, tra, cens.name, s, cova = FALSE)
        res[i] <- etm::clos(tr.prob)$e.phi
    }
    res
}

## bootstrap
se <- sqrt(var(boot.clos(my.observ, c("0","1","2","3"), tra, NULL, 0,
                         nboot = 10)))



