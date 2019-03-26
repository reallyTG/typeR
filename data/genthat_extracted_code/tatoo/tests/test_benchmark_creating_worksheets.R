library(microbenchmark)


tdat <- lapply(1:100, function(...) iris)

tdat <- tatoo::compile_report_list(tdat)

microbenchmark(
  as_workbook(tdat),
  as_workbook(tdat, named_regions = FALSE)
)


x <- as_workbook(tdat)
y <- as_workbook(tdat, named_regions = FALSE)

openxlsx::getNamedRegions(x)
openxlsx::getNamedRegions(y)


 #                                     expr       min        lq      mean    median        uq       max neval cld
 #                        as_workbook(tdat) 1093.5865 1129.2576 1163.9993 1147.5394 1173.1333 2247.9885   100   b
 # as_workbook(tdat, named_regions = FALSE)  776.7931  802.4814  828.5677  824.1601  849.2025  935.5138   100  a
