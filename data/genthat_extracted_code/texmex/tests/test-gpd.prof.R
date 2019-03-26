context("gpd.prof")

test_that("gpd.prof behaves as it should", {
	skip_on_cran()
	skip_on_travis()
	
	m <- 100 * 365.25

	# no penalty - reproduce Coles chapter 4 rainfall example
	fit <- evm(rain,th=30)
	p <- predict(fit,M=m,ci.fit=TRUE)
	pl.int <- gpd.prof(fit,m=m,xmax=p$obj[[1]][1],xlow=p$obj[[1]][2])
	
	# very weak/flat prior
	fit.pen <- evm(rain,th=30,penalty="gaussian",priorParameters=list(c(0,0),matrix(c(100,0,0,100),ncol=2)))
	p.pen <- predict(fit.pen,M=m,ci.fit=TRUE)
	pl.int.pen <- gpd.prof(fit.pen,m=m,xmax=p.pen$obj[[1]][1],xlow=p.pen$obj[[1]][2])
	
	# stronger prior
	fit.pen2 <- evm(rain,th=30,penalty="gaussian",priorParameters=list(c(0,0),matrix(c(100,0,0,1),ncol=2)))
	p.pen2 <- predict(fit.pen2,M=m,ci.fit=TRUE)
	pl.int.pen2 <- gpd.prof(fit.pen2,m=m,xmax=p.pen2$obj[[1]][1],xlow=p.pen2$obj[[1]][2])
	
	expect_equal(pl.int,c(Lower0.95=80.86,Upper0.95=185.036),tolerance = 0.01)
	expect_equal(pl.int.pen,c(Lower0.95=80.864,Upper0.95=185.036),tolerance = 0.01)
	expect_equal(pl.int.pen2,c(Lower0.95=80.86,Upper0.95=185.06),tolerance = 0.01)

	# different confidence levels
	pl.int.9 <- gpd.prof(fit,m=m,xmax=p$obj[[1]][1],xlow=p$obj[[1]][2],conf=0.9,PlotIt=FALSE)
	pl.int.8 <- gpd.prof(fit,m=m,xmax=p$obj[[1]][1],xlow=p$obj[[1]][2],conf=0.8,PlotIt=FALSE)
	
	expect_equal(pl.int.9,c(Lower0.9=83.50,Upper0.9=164.72),tolerance = 0.01)
	expect_equal(pl.int.8,c(Lower0.8=87.06,Upper0.8=146.16),tolerance = 0.01)
}
)

