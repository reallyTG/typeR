library(surveillance)


### Name: stcd
### Title: Spatio-temporal cluster detection
### Aliases: stcd
### Keywords: cluster

### ** Examples

if (require("splancs")) {
    # load the data from package "splancs"
    data(burkitt, package="splancs")

    # order the times
    burkitt <- burkitt[order(burkitt$t), ]

    #Parameters for the SR detection
    epsilon <- 0.5 # relative change within the cluster
    radius <- 20 # radius
    threshold <- 161 # threshold limit

    res <- stcd(x=burkitt$x,
                y=burkitt$y,
                t=burkitt$t,
                radius=radius,
                epsilon=epsilon,
                areaA=1,
                areaAcapBk=1,
                threshold=threshold)

    #Index of the event
    which.max(res$R >= threshold)
}



