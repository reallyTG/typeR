rm(list=ls())
set.seed(11)
install.packages("optimParallel")

x <- rnorm(n=1000, mean=5, sd=2)
negll <- function(par, x) -sum(dnorm(x=x, mean=par[1], sd=par[2], log=TRUE))
o1 <- optim(par=c(1, 1), fn=negll, x=x, method="L-BFGS-B", lower=c(-Inf, 0.0001))
o1$par


install.packages("optimParallel")
library("optimParallel")
cl <- makeCluster(detectCores()); setDefaultCluster(cl=cl)
o2 <- optimParallel(par=c(1, 1), fn=negll, x=x, method="L-BFGS-B",
                    lower=c(-Inf, 0.0001))
identical(o1, o2)


o3 <- optimParallel(par=c(1, 1), fn=negll, x=x, method="L-BFGS-B",
                    lower=c(-Inf, 0.0001), parallel=list(loginfo=TRUE))
print(o3$loginfo[1:3,], digits=3)


## make fig
library(ggplot2); theme_set(theme_bw())
pdf("path.pdf", width = 8*.9*.9, height = 5*.8*.9)
grid <- expand.grid(par1=seq(.7, 7, length.out=100),
                    par2=seq(.7, 4, length.out=100),
                    z=NA)
for(i in 1:nrow(grid))
    grid$z[i] <- negll(c(grid$par1[i], grid$par2[i]), x=x)
col <- alpha(colorRampPalette(c("gray"))(55), 1)
stroke <- 1.1
shape <- 1
ggplot(data=data.frame(o3$log), aes(x=par1, y=par2)) +
    geom_contour(mapping=aes(x=par1, y=par2, z=z, color=..level..), data=grid,
                 bins=55) +
    geom_vline(xintercept=data.frame(o3$log)[nrow(o3$log),"par1"], color="darkRed") +
    geom_hline(yintercept=data.frame(o3$log)[nrow(o3$log),"par2"], color="darkRed") +
    geom_segment(aes(xend=c(tail(par1, n=-1), NA), yend=c(tail(par2, n=-1), NA)),
                  arrow=arrow(length=unit(0.5,"cm"), type = "open", angle=30), size=.7,
                 color="darkBlue") +
    geom_point(data=head(data.frame(o3$log),1), size =2, color="darkBlue")+
    scale_color_gradientn(colours=col)+
    scale_x_continuous(expand = c(0,0), limits=range(grid$par1)) +
    scale_y_continuous(expand = c(0,0), limits=range(grid$par2)) +
    xlab(expression(mu)) + ylab(expression(sigma))+
    theme(legend.position="none",
          panel.grid.major = element_blank(), panel.grid.minor = element_blank())
dev.off()


demo_generator <- function(fn, gr){
    par_last <- value <- grad <- NA
    eval <- function(par){
        if(!identical(par, par_last)){
            message("--> evaluate fn() and gr()")
            par_last <<- par
            value <<- fn(par)  
            grad <<- gr(par)   
        } else
            message("--> read stored value")
    }
    f <- function(par){
        eval(par=par)
        value
    }
    g <- function(par){
        eval(par=par)
        grad
    }
    list(f=f, g=g)
}

demo <- demo_generator(fn=sum, gr=prod)
demo$f(1:5)
demo$g(1:5)


fn <- function(par, sleep){
    Sys.sleep(sleep)
    sum(par^2)
}

gr <- function(par, sleep){
    Sys.sleep(sleep)
    2*par
}
