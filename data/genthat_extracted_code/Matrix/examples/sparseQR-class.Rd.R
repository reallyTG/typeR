library(Matrix)


### Name: sparseQR-class
### Title: Sparse QR decomposition of a sparse matrix
### Aliases: sparseQR-class qr.R,sparseQR-method qr.Q qr.Q,sparseQR-method
###   qr.coef,sparseQR,ddenseMatrix-method qr.coef,sparseQR,matrix-method
###   qr.coef,sparseQR,Matrix-method qr.coef,sparseQR,numeric-method
###   qr.fitted,sparseQR,ddenseMatrix-method
###   qr.fitted,sparseQR,matrix-method qr.fitted,sparseQR,Matrix-method
###   qr.fitted,sparseQR,numeric-method qr.qty,sparseQR,ddenseMatrix-method
###   qr.qty,sparseQR,matrix-method qr.qty,sparseQR,numeric-method
###   qr.qty,sparseQR,Matrix-method qr.qy,sparseQR,ddenseMatrix-method
###   qr.qy,sparseQR,matrix-method qr.qy,sparseQR,numeric-method
###   qr.qy,sparseQR,Matrix-method qr.resid,sparseQR,ddenseMatrix-method
###   qr.resid,sparseQR,matrix-method qr.resid,sparseQR,Matrix-method
###   qr.resid,sparseQR,numeric-method
### Keywords: classes algebra array

### ** Examples

data(KNex)
mm <- KNex $ mm
 y <- KNex $  y
 y. <- as(as.matrix(y), "dgCMatrix")
str(qrm <- qr(mm))
 qc  <- qr.coef  (qrm, y); qc. <- qr.coef  (qrm, y.) # 2nd failed in Matrix <= 1.1-0
 qf  <- qr.fitted(qrm, y); qf. <- qr.fitted(qrm, y.)
 qs  <- qr.resid (qrm, y); qs. <- qr.resid (qrm, y.)
stopifnot(all.equal(qc, as.numeric(qc.),  tolerance=1e-12),
          all.equal(qf, as.numeric(qf.),  tolerance=1e-12),
          all.equal(qs, as.numeric(qs.),  tolerance=1e-12),
          all.equal(qf+qs, y, tolerance=1e-12))



