library(PKI)


### Name: X509
### Title: Public Key Instraftructure (X509) functions
### Aliases: X509 PKI.load.cert PKI.verifyCA PKI.pubkey PKI.get.subject
### Keywords: manip

### ** Examples

  ca <- PKI.load.cert(file=system.file("certs", "RForge-ca.crt", package="PKI"))
  my.cert <- PKI.load.cert(readLines(system.file("certs", "demo.crt", package="PKI")))
  PKI.verifyCA(my.cert, ca)
  PKI.pubkey(my.cert)
  PKI.get.subject(my.cert)



