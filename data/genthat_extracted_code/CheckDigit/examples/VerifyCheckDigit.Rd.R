library(CheckDigit)


### Name: VerifyCheckDigit
### Title: Verify whether a value ends with a valid check digit
### Aliases: VerifyCheckDigit

### ** Examples

VerifyCheckDigit('12340', 'Verhoeff')  # TRUE
VerifyCheckDigit('21340', 'Verhoeff')  # FALSE
VerifyCheckDigit('13240', 'Verhoeff')  # FALSE
VerifyCheckDigit('12430', 'Verhoeff')  # FALSE
VerifyCheckDigit('12304', 'Verhoeff')  # FALSE



