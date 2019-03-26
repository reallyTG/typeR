library(RcppGetconf)


### Name: getConfig
### Title: Return a System Configuration Setting
### Aliases: getConfig

### ** Examples

if (Sys.info()[["sysname"]] != "SunOS") {
    getConfig("_NPROCESSORS_CONF")   # number of processor
    getConfig("LEVEL1_ICACHE_SIZE")  # leve1 cache size
    getConfig("GNU_LIBC_VERSION")    # libc version
}



