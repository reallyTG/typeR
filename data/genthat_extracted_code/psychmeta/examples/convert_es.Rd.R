library(psychmeta)


### Name: convert_es
### Title: Convert effect sizes and compute confidence intervals
### Aliases: convert_es

### ** Examples

## To convert a statistic to r or d metric:
convert_es(es = 1,  input_es="d", output_es="r", n1=100)
convert_es(es = 1, input_es="d", output_es="r", n1=50, n2 = 50)
convert_es(es = .2, input_es="r", output_es="d",  n1=100, n2=150)
convert_es(es = -1.3, input_es="t", output_es="r", n1 = 100, n2 = 140)
convert_es(es = 10.3, input_es="F", output_es="d", n1 = 100, n2 = 150)
convert_es(es = 1.3, input_es="chisq", output_es="r", n1 = 100, n2 = 100)
convert_es(es = .021, input_es="p.chisq", output_es="d", n1 = 100, n2 = 100)
convert_es(es = 4.37, input_es="or", output_es="r", n1=100, n2=100)
convert_es(es = 4.37, input_es="or", output_es="d", n1=100, n2=100)
convert_es(es = 1.47, input_es="lor", output_es="r", n1=100, n2=100)
convert_es(es = 1.47, input_es="lor", output_es="d", n1=100, n2=100)

## To simply compute a confidence interval for r, d, or A:
convert_es(es = .3,  input_es="r", output_es="r", n1=100)
convert_es(es = .8,  input_es="d", output_es="d", n1=64, n2=36)
convert_es(es = .8,  input_es="A", output_es="A", n1=64, n2=36)



