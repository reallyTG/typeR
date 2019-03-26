library(sensitivitymv)


### Name: truncatedP
### Title: Trucated product of P-values.
### Aliases: truncatedP

### ** Examples

# Evidence factor example: see note above.
	data(mtm)
	senmv(-mtm,gamma=11.7,trim=1)
	senmv(-mtm[,2:3],gamma=2.1,trim=1)
	senmv(-mtm,gamma=12,trim=1)
	senmv(-mtm[,2:3],gamma=3,trim=1)
	truncatedP(c(0.05167572,0.1527849),trunc=1)
	truncatedP(c(0.05167572,0.1527849),trunc=.2)



