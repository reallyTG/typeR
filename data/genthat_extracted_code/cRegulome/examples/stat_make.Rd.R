library(cRegulome)


### Name: stat_make
### Title: Make A SQL statement
### Aliases: stat_make

### ** Examples

stat_make(reg = 'hsa-let-7g',
          study = 'STES')
          
stat_make(reg = 'hsa-let-7g',
          study = 'STES',
          min_abs_cor = .3)
          
stat_make(reg = 'hsa-let-7g',
          study = 'STES',
          min_abs_cor = .3,
          max_num = 5)
          



