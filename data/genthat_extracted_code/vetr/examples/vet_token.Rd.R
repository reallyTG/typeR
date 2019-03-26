library(vetr)


### Name: vet_token
### Title: Vetting Tokens With Custom Error Messages
### Aliases: vet_token NO.NA vet_token NO.INF vet_token GTE.0 vet_token
###   LTE.0 vet_token GT.0 vet_token LT.0 vet_token INT.1 vet_token
###   INT.1.POS vet_token INT.1.NEG vet_token INT.1.POS.STR vet_token
###   INT.1.NEG.STR vet_token INT vet_token INT.POS vet_token INT.NEG
###   vet_token INT.POS.STR vet_token INT.NEG.STR vet_token NUM.1 vet_token
###   NUM.1.POS vet_token NUM.1.NEG vet_token NUM vet_token NUM.POS
###   vet_token NUM.NEG vet_token CHR.1 vet_token CHR vet_token CPX
###   vet_token CPX.1 vet_token LGL vet_token LGL.1
### Keywords: datasets

### ** Examples

## Predefined tokens:
vet(INT.1, 1:2)
vet(INT.1 || LGL, 1:2)
vet(INT.1 || LGL, c(TRUE, FALSE))

## Check squareness
mx <- matrix(1:3)
SQR <- vet_token(nrow(.) == ncol(.), "%sshould be square")
vet(SQR, mx)

## Let `vetr` make up error message; note `quote` vs `vet_token`
## Often, `vetr` does fine without explictly specified err msg:
SQR.V2 <- quote(nrow(.) == ncol(.))
vet(SQR.V2, mx)

## Combine some tokens, notice how we use `quote` at the combining
## step:
NUM.MX <- vet_token(matrix(numeric(), 0, 0), "%sshould be numeric matrix")
SQR.NUM.MX <- quote(NUM.MX && SQR)
vet(SQR.NUM.MX, mx)

## If instead we used `vet_token` the overall error message
## is not used; instead it falls back to the error message of
## the specific sub-token that fails:
NUM.MX <- vet_token(matrix(numeric(), 0, 0), "%sshould be numeric matrix")
SQR.NUM.MX.V2 <-
  vet_token(NUM.MX && SQR, "%sshould be a square numeric matrix")
vet(SQR.NUM.MX.V2, mx)



