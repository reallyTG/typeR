library(icapca)


### Name: ica_pca
### Title: Performs mixed ICA/PCA on the input matrix
### Aliases: ica_pca
### Keywords: multivariate

### ** Examples


x<-matrix(nrow=4, ncol=150)
x[1,]<-iris[[1]]
x[2,]<-iris[[2]]
x[3,]<-iris[[3]]
x[4,]<-iris[[4]]
result<-ica_pca(x,inf_crit='xval', subgaussian_range=c(1,1), supergaussian_range=c(3,3))
area<-as.double(dim(x)[2])

subg<-function(x){return ((area*plot_width/sqrt(pi*exp(1)))*exp(-x*x)*cosh(sqrt(2)*x))}
superg<-function(x){return ((area*plot_width)/(2*cosh(pi*x/2.0)))}
gaussian<-function(x){return ((area*plot_width/sqrt(2*pi))*exp(-x*x))}
distributions<-list(subg, superg, gaussian)

par(mfrow=c(2,2))

plot_params<-hist(result$s[1,], ylim=c(0,45))
plot_width=plot_params$breaks[2]-plot_params$breaks[1]
par(new=TRUE)
plot(distributions[[result$distribution[1]+1]], 
    plot_params$breaks[1], 
    plot_params$breaks[length(plot_params$breaks)],
    ylim=c(0,45),
    xlab="",
    ylab="")
par(new=FALSE)

plot_params<-hist(result$s[2,], ylim=c(0,45))
plot_width=plot_params$breaks[2]-plot_params$breaks[1]
par(new=TRUE)
plot(distributions[[result$distribution[2]+1]], 
    plot_params$breaks[1], 
    plot_params$breaks[length(plot_params$breaks)], 
    ylim=c(0,45), 
    xlab="",
    ylab="")
par(new=FALSE)


plot_params<-hist(result$s[3,], ylim=c(0,45))
plot_width=plot_params$breaks[2]-plot_params$breaks[1]
par(new=TRUE)
plot(distributions[[result$distribution[3]+1]], 
    plot_params$breaks[1], 
    plot_params$breaks[length(plot_params$breaks)], 
    ylim=c(0,45), 
    xlab="",
    ylab="")
par(new=FALSE)

plot_params<-hist(result$s[4,], ylim=c(0,90))
plot_width=plot_params$breaks[2]-plot_params$breaks[1]
par(new=TRUE)
plot(distributions[[result$distribution[4]+1]], 
    plot_params$breaks[1], 
    plot_params$breaks[length(plot_params$breaks)], 
    ylim=c(0,90), 
    xlab="",
    ylab="")
par(new=FALSE)

x_centered<-x
for (i in 1:(dim(x))[1]) x_centered[i,]=x_centered[i,]-mean(x_centered[i,])
w=t(qr.solve(t(x_centered),t(result$s)))

residuals<-w%*%x_centered-result$s



