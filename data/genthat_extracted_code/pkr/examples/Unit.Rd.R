library(pkr)


### Name: Unit
### Title: Disply CDISC standard units and multiplied factor of NCA results
### Aliases: Unit

### ** Examples

Unit(concUnit="ug/L", doseUnit="mg")
Unit(concUnit="ng/L", doseUnit="mg")

Unit(concUnit="umol/L", doseUnit="mmol")
Unit(concUnit="nmol/L", doseUnit="mmol")

Unit(concUnit="mmol/L", doseUnit="mg", MW=500)
Unit(concUnit="umol/L", doseUnit="mg", MW=500)
Unit(concUnit="nmol/L", doseUnit="mg", MW=500)
Unit(concUnit="nmol/mL", doseUnit="mg", MW=500)

Unit(concUnit="ug/L", doseUnit="mmol", MW=500)
Unit(concUnit="ug/L", doseUnit="mol", MW=500)
Unit(concUnit="ng/L", doseUnit="mmol", MW=500)
Unit(concUnit="ng/mL", doseUnit="mmol", MW=500)

Unit(concUnit="nmol/L", doseUnit="mg")
Unit(concUnit="ug/L", doseUnit="mmol")



